# Clone and Run Action

This GitHub Action allows to clone a private repository, checkout to a specific branch and specify a command to run.

Inputs:

- **user**: GitHub user that has permissions to clone the repository
- **token**: PAT to clone repositories
- **organization**: GitHub organization in which the repository exists
- **repository**: name of the repository to clone
- **branch**: branch that needs to be checked out
- **command**: command to run inside the repository directory

All the above inputs are required for a correct functioning.
