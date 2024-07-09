"""
This module defines schema classes for an OCL Concepts, 
    Repository and Organizations.
"""

from typing import Callable


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

    id: str = "id"
    name: str = "name"
    datatype: str = "datatype"
    description: str = "description"
    include_columns: list[str] = []
    exclude_columns: list[str] = []
    format_extras_for_csv: Callable = lambda x: f"attr:{x}"
    additional_names: list[str] = []
    additional_descriptions: list[str] = []


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

    id: str = "id"
    name: str = "name"
    company: str = "company"
    website: str = "website"
    location: str = "location"
    public_access: str = "public_access"
    logo_url: str = "logo_url"
    description: str = "description"
    text: str = "text"
    include_columns: list[str] = []
    exclude_columns: list[str] = []
    format_extras_for_csv: Callable = lambda key, type: f"attr:{key}:{type}".rstrip(":")


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

    id: str = "id"
    name: str = "name"
    owner_id: str = "owner_id"
    owner_type: str = "owner_type"
    description: str = "description"
    public_access: str = "public_access"
    include_columns: str = []
    exclude_columns: str = []
    format_extras_for_csv: Callable = lambda x: f"attr:{x}"
