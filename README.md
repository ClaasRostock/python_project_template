# Python Project Template

Template repository for Python projects.

## Create a new repository based on this template
* On GitHub, create a new repository. When prompted, select [python_project_template](https://github.com/ClaasRostock/python_project_template) as template.
* Clone the new repository to your local machine.

## Rename package name, author, etc in the newly created repository
1. In your local clone (i.e. on your local machine), enter any new names in the `names.csv` file to change the package name, author name etc. <br>
Enter new values right after the `,` in each line. Leave empty for fields you do not want to be set. <br>
Mandatory fields are: <br>
`PackageNameDashed` , e.g. `my-package` <br>
`PackageNameCapitalized` , e.g. `MyPackage`  <br>
`GitHubOrganisation` , e.g. `owner`  <br>
`Author1Name` , e.g. `Author One`  <br>
`Author1Email` , e.g. `author.one@xyz.com`  <br>
All other fields are optional (yet will help you to set up the package more comprehensively).
2. In your local terminal, run `./rename_package.ps1`. This will create a new local branch named `rename-package` in which all name changes get applied.
3. Review the changes made in the `rename-package` branch.
4. If ok, merge `rename-package` into `main`. <br>
   If not ok, delete the local branch `rename-package`, and repeat from step 1.
5. Finally, push your changes in `main` to remote.

## Create "RELEASE_TOKEN"
* In the GitHub Settings of the newly created repository, create an environment named `release`, and within that a secret named `RELEASE_TOKEN` containing a personal access token (PAT) from you. The PAT need to have the following scope:
  * gist
  * repo
  * workflow
