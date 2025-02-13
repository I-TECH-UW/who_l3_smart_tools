import os
import re
import sys


class CQLSubsetGenerator:
    def __init__(self, base_cql_dir=None, output_dir=None):
        self.base_cql_dir = base_cql_dir
        self.output_dir = output_dir  # New parameter for output directory

    def read_file(self, file_path):
        with open(file_path, encoding="utf-8") as f:
            return f.read()

    def get_includes(self, content):
        """
        Returns a mapping of alias to library file path.
        Expects lines like:
          include HIVIndicatorElements version '...' called HIE
        """
        includes = {}
        pattern = re.compile(
            r"include\s+(\S+)\s+version\s+'[^']+'\s+called\s+(\S+)", re.IGNORECASE
        )
        for lib, alias in pattern.findall(content):
            lib_file = os.path.join(self.base_cql_dir, lib + ".cql")
            includes[alias] = lib_file
        return includes

    def get_definitions(self, content):
        """
        Returns a dictionary mapping definition name to its text.
        Matches both quoted and unquoted definition names.
        """
        definitions = {}
        # Regex: match lines starting with "define" then either "quoted" or bare name, then a colon.
        pattern = re.compile(
            r"define\s+(?:\"([^\"]+)\"|([a-zA-Z0-9_]+))\s*:", re.IGNORECASE
        )
        # Also capture the position so we cut out blocks of text.
        matches = list(pattern.finditer(content))
        for idx, match in enumerate(matches):
            def_name = match.group(1) if match.group(1) else match.group(2)
            start = match.start()
            end = matches[idx + 1].start() if idx + 1 < len(matches) else len(content)
            definitions[def_name.strip()] = content[start:end].strip()
        return definitions

    def find_references(self, content, aliases):
        """
        Searches for references of the form Alias.<definition name>
        Returns a mapping of alias -> set of definition names referenced.
        """
        references = {alias: set() for alias in aliases}
        for alias in aliases:
            # This regex matches: alias. followed by either "quoted text" or a bare identifier.
            regex = re.compile(rf"\b{alias}\.(?:(\"([^\"]+)\")|([a-zA-Z0-9_]+))")
            for match in regex.finditer(content):
                ref_name = match.group(2) if match.group(2) else match.group(3)
                if ref_name:
                    references[alias].add(ref_name.strip())
        return references

    def build_subset_for_alias(self, alias, initial_required, lib_path):
        """
        Build a dependency closure for a given library (alias).
        initial_required is a set of definition names referenced in the indicator.
        Returns a dictionary mapping definition names to their full text.
        """
        content = self.read_file(lib_path)
        all_defs = self.get_definitions(content)
        subset = {}
        to_process = list(initial_required)
        processed = set()
        while to_process:
            def_name = to_process.pop()
            if def_name in processed:
                continue
            processed.add(def_name)
            if def_name in all_defs:
                subset[def_name] = all_defs[def_name]
                # Inspect the text for additional references in the same alias.
                refs = self.find_references(all_defs[def_name], [alias])[alias]
                for r in refs:
                    if r not in processed:
                        to_process.append(r)
            else:
                print(
                    f"Warning: definition '{def_name}' not found in {lib_path}",
                    file=sys.stderr,
                )
        return subset

    def recursive_extract(self, indicator_file, collected=None, processed_files=None):
        """
        Starting from an indicator file, parse its content, and for every include alias
        and referenced definition, load the corresponding library file and collect its definitions.
        Returns a mapping: library alias -> { definition name : definition text }
        """
        if collected is None:
            collected = {}
        if processed_files is None:
            processed_files = set()

        indicator_path = os.path.abspath(indicator_file)
        if indicator_path in processed_files:
            return collected
        processed_files.add(indicator_path)

        content = self.read_file(indicator_path)
        includes = self.get_includes(content)
        refs = self.find_references(content, includes.keys())

        # Process each referenced library
        for alias, def_names in refs.items():
            lib_path = includes[alias]
            if not os.path.exists(lib_path):
                print(
                    f"Warning: library file not found for alias {alias}: {lib_path}",
                    file=sys.stderr,
                )
                continue
            # Read library file only once
            if alias not in collected:
                lib_content = self.read_file(lib_path)
                definitions = self.get_definitions(lib_content)
                collected[alias] = {}
                for def_name in def_names:
                    if def_name in definitions:
                        collected[alias][def_name] = definitions[def_name]
                    else:
                        print(
                            f"Warning: definition '{def_name}' not found in {lib_path}",
                            file=sys.stderr,
                        )
                # Recurse into the library file itself in case it uses further includes
                self.recursive_extract(lib_path, collected, processed_files)
        return collected

    def run(self, indicator_file):
        indicator_content = self.read_file(indicator_file)
        includes = self.get_includes(indicator_content)
        # Get initial references from indicator file.
        initial_refs = self.find_references(indicator_content, includes.keys())
        subsets = {}
        # For each included library alias, build the dependency closure.
        for alias, lib_path in includes.items():
            req = initial_refs.get(alias, set())
            # Build the closure only if definitions are requested.
            if req:
                subsets[alias] = self.build_subset_for_alias(alias, req, lib_path)
        # Generate output content per library.
        for alias, definitions in subsets.items():
            out_lines = []
            # Optionally, add a library header if desired.
            out_lines.append(f"// Subset for library alias {alias}")
            for def_name, text in definitions.items():
                out_lines.append(text)
                out_lines.append("\n")
            out_content = "\n".join(out_lines)
            print(out_content)
            if self.output_dir:
                if not os.path.exists(self.output_dir):
                    os.makedirs(self.output_dir, exist_ok=True)
                # Use the library file base name for output
                lib_file = os.path.basename(includes[alias])
                lib_name, _ = os.path.splitext(lib_file)
                output_file_path = os.path.join(
                    self.output_dir, f"{lib_name}_subset.cql"
                )
                with open(output_file_path, "w", encoding="utf-8") as f:
                    f.write(out_content)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python extract_cql_entries.py <indicator_file_path>")
        sys.exit(1)
    indicator_file = sys.argv[1]
    if not os.path.exists(indicator_file):
        print(f"Indicator file not found: {indicator_file}")
        sys.exit(1)

    base_cql_dir = "/Users/pmanko/code/smart-hiv-mini/input/cql"
    generator = CQLSubsetGenerator(base_cql_dir)
    generator.run(indicator_file)
