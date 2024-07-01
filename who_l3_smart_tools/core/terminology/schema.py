class ConceptSchema:
    """
    Represents the schema for a concept.

    Attributes:
        id (str): The ID of the concept.
        name (str): The name of the concept.
        datatype (str): The datatype of the concept.
        description (str): The description of the concept.
        include_columns (list): A list of columns to include.
        exclude_columns (list): A list of columns to exclude.
        format_extras_for_csv (function): A lambda function to format extras for CSV.
        additional_names (list): A list of additional names for the concept.
        additional_descriptions (list): A list of additional descriptions for the concept.
    """
    id = "id"
    name = "name"
    datatype = "datatype"
    description = "description"
    include_columns = []
    exclude_columns = []
    format_extras_for_csv = lambda x: f"attr:{x}"
    additional_names = []
    additional_descriptions = []


class OrganizationSchema:
    """
    Represents the schema for an organization.

    Attributes:
        id (str): The ID of the organization.
        name (str): The name of the organization.
        company (str): The company associated with the organization.
        website (str): The website URL of the organization.
        location (str): The location of the organization.
        public_access (str): The public access level of the organization.
        logo_url (str): The URL of the organization's logo.
        description (str): The description of the organization.
        text (str): The text content of the organization.
        include_columns (list): A list of columns to include.
        exclude_columns (list): A list of columns to exclude.
        format_extras_for_csv (function): A lambda function to format extras for CSV.

    """
    id = "id"
    name = "name"
    company = "company"
    website = "website"
    location = "location"
    public_access = "public_access"
    logo_url = "logo_url"
    description = "description"
    text = "text"
    include_columns = []
    exclude_columns = []
    format_extras_for_csv = lambda key, type: f"attr:{key}:{type}".rstrip(":")


class RepositorySchema:
    """
    Represents the schema for a repository.

    Attributes:
        id (str): The ID of the repository.
        name (str): The name of the repository.
        owner_id (str): The ID of the repository owner.
        owner_type (str): The type of the repository owner.
        description (str): The description of the repository.
        public_access (str): The public access level of the repository.
        include_columns (list): The list of columns to include.
        exclude_columns (list): The list of columns to exclude.
        format_extras_for_csv (function): A lambda function to format extras for CSV.
    """
    id = "id"
    name = "name"
    owner_id = "owner_id"
    owner_type = "owner_type"
    description = "description"
    public_access = "public_access"
    include_columns = []
    exclude_columns = []
    format_extras_for_csv = lambda x: f"attr:{x}"