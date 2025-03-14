# Changelog

All notable changes to the [my-package] project will be documented in this file.<br>
The changelog format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

-/-


## [0.2.2] - 2025-03-14

### Changed
* README.md : Added option `-U` to all calls to `uv sync`
* GitHub workflow _test_future.yml : added a step to remove the Python upper version constraint from pyproject.toml


## [0.2.1] - 2025-03-13

### Added
* Sphinx documentation: Added extension to support Markdown-based diagrams created with Mermaid.
* Added CITATION.cff file allowing to enter citation information which gets shown on GitHub.
* Added support for Python 3.13
* pyproject.toml : Added keywords
* Added PowerShell script `rename_package.ps1`, supporting the initial renaming of package name, author, modules etc after a new repository has been created based on this template.
* Added a temporary `README.md`, documenting how to create a new repository based on this template. <br>
The original README.md does still exist, but got renamed to `_README.md`. <br>
The PowerShell script `rename_package.ps1` also takes care to delete the temporary README.md containing the instructions on template usage and restore the original / "production" `README.md` .

### Changed
* Sphinx documentation: Changed default top-level structure for API documentation.
* ruff.toml: updated
* pytest.ini : Added option `--duration=10`. <br>
  This will show a table listing the 10 slowest tests at the end of any test session.
* pyproject.toml:
  * cleaned up and restructured dependencies
  * Turned 'dev-dependencies' into a dependency group 'dev' in table [dependency-groups]. <br>
    (This is the more modern style to declare project dependencies)
* VS Code settings: Changed "mypy-type-checker.preferDaemon" from 'false' to 'true'
* Sphinx documentation:
  * index.rst : Changed order of toc tree headlines
  * conf.py : Added selected settings introduced in the latest work in axtreme repository
* tests/test_api.py : Added type annotation for return types
* GitHub workflows _test.yml and _test_future.yml : rewrote how pytest gets called in a cleaner way
* Renamed the CLI module from 'src/my_package/cli/my_package.py' to 'src/my_package/cli/\_\_main\_\_.py' in order to avoid an import error establishing in case the user chooses a single-word package name (i.e. a package name without a hyphen). In such case, the names of the CLI script, the CLI module and the package are all same, which leads to problems when importing from the package inside the CLI module. Giving the CLI module a different name (as e.g. done now by renaming 'my_package.py' to '\_\_main\_\_.py') solves the name clash and import error.
* Do not run code quality checks in nightly builds
* Included uv.lock file in version control
* GitHub workflows: Enable cache by default. <br>

### Solved
* Sphinx documentation: Resolved issue that documentation of class members was generated twice.
* pre-commit-config.yaml: Corrected how `--fix=auto` gets passed as argument
* Resolved issues raised by `ruff` 0.9.5

### Dependencies
* Updated to torch==2.6.0  (from torch==2.5.1)
* Updated to ruff>=0.9.5  (from ruff>=0.9.2)
* Updated to pyright>=1.1.393  (from pyright>=1.1.392)
* Updated to sourcery>=1.33  (from sourcery>=1.31)
* Updated to sphinx-autodoc-typehints>=3.0  (from sphinx-autodoc-typehints>=2.5)
* Updated to mypy>=1.14  (from mypy>=1.13)
* Updated to setup-uv@v5  (from setup-uv@v2)
* Updated to dictIO>=0.4.1  (from dictIO>=0.4.0)


## [0.1.9] - 2024-09-27

### Changed
* Changed from `pip`/`tox` to `uv` as package manager
* README.md : Completely rewrote section "Development Setup", introducing `uv` as package manager.
* Changed publishing workflow to use OpenID Connect (Trusted Publisher Management) when publishing to PyPI
* Updated copyright statement
* VS Code settings: Turned off automatic venv activation
* replaced black formatter with ruff formatter
* removed black

### Removed
* VS Code settings: Removed the setting which added the /src folder to PythonPath. This is no longer necessary. `uv` installs the project itself as a package in "editable" mode, which removes the need to manually add /src to the PythonPath environment variable.

### GitHub workflows
* (all workflows): Adapted to use `uv` as package manager
* _test_future.yml : updated Python version to 3.13.0-alpha - 3.13.0
* _test_future.yml : updated name of test job to 'test313'

### Dependencies
* updated to ruff>=0.6.3  (from ruff==0.2.1)
* updated to pyright>=1.1.378  (from pyright==1.1.350)
* updated to setup-python@v5  (from setup-python@v4)
* updated to actions-gh-pages@v4  (from actions-gh-pages@v3)
* updated to upload-artifact@v4  (from upload-artifact@v3)
* updated to download-artifact@v4  (from download-artifact@v3)
* updated to sourcery>=1.22  (from sourcery==1.16)
* updated to dictIO>=0.3.4  (from dictIO>=0.3.1)
* removed black


## [0.1.6] - 2024-02-20

### Changed
* Moved all project configuration from setup.cfg to pyproject.toml
* Moved all tox configuration from setup.cfg to tox.ini.
* Moved pytest configuration from pyproject.toml to pytest.ini
* Deleted setup.cfg

### Dependencies
* updated to black[jupyter]==24.1  (from black[jupyter]==23.12)
* updated to ruff==0.2.1  (from ruff==0.1.8)
* updated to pyright==1.1.350  (from pyright==1.1.338)
* updated to sourcery==1.15  (from sourcery==1.14)
* updated to dictIO>=0.3.1  (from dictIO>=0.2.9)


## [0.1.4] - 2023-11-08

### Changed

* incorporated latest updates introduced in projects

### Dependencies

* Updated dependencies to latest versions


## [0.1.3] - 2023-08-24

### Changed

* GitHub workflow publish_release.yml: corrected smaller errors
* Explicitly removed .env file from remote repository
* Updated README.md to include guidance on how to create a .env file locally
* dependencies: updated packages in requirements-dev.txt to latest versions


## [0.1.2] - 2023-06-22

### Changed

* Modularized GitHub workflows
* requirements-dev.txt: Updated dependencies to latest versions
* setup.cfg: indicated supported Python versions as py310 and py311 <br>
  (from formerly py39 and py310)
* GitHub workflows: changed default Python version from 3.10 to 3.11


## [0.1.0] - 2023-02-21

### Changed

* pyproject.toml: Changed ruff configuration to by default allow Uppercase variable names in functions. <br>
(As this is a very common case in science calculus)
* README.md: Changed install infos for development setup to pip install requirements-dev.txt (not requirements.txt)


## [0.0.1] - 2023-02-21

* Initial release

### Added

* added this

### Changed

* changed that

### Dependencies

* updated to some_package_on_pypi>=0.1.0

### Fixed

* fixed issue #12345

### Deprecated

* following features will soon be removed and have been marked as deprecated:
    * function x in module z

### Removed

* following features have been removed:
    * function y in module z



<!-- Markdown link & img dfn's -->
[unreleased]: https://github.com/owner/my-package/compare/v0.2.2...HEAD
[0.2.2]: https://github.com/owner/my-package/releases/tag/v0.2.1...v0.2.2
[0.2.1]: https://github.com/owner/my-package/releases/tag/v0.1.9...v0.2.1
[0.1.9]: https://github.com/owner/my-package/releases/tag/v0.1.6...v0.1.9
[0.1.6]: https://github.com/owner/my-package/releases/tag/v0.1.4...v0.1.6
[0.1.4]: https://github.com/owner/my-package/releases/tag/v0.1.3...v0.1.4
[0.1.3]: https://github.com/owner/my-package/releases/tag/v0.1.2...v0.1.3
[0.1.2]: https://github.com/owner/my-package/releases/tag/v0.1.0...v0.1.2
[0.1.0]: https://github.com/owner/my-package/releases/tag/v0.0.1...v0.1.0
[0.0.1]: https://github.com/owner/my-package/releases/tag/v0.0.1
[my-package]: https://github.com/owner/my-package
