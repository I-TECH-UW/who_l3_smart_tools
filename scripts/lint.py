import subprocess


def main():
    subprocess.run(["flake8", "."])


if __name__ == "__main__":
    main()
