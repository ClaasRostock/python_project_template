# Changelog

All notable changes to the [my-package] project will be documented in this file.<br>
The changelog format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Changed
* GitHub workflow _test_future.yml:
  * Improved the regex and PowerShell code that finds and removes the Python upper version constraint in pyproject.toml


## [0.2.4] - 2025-12-02

### Changed
* ruff.toml:
  * updated target Python version to "py311"
* pyproject.toml:
  * removed leading carets and trailing slashes from 'exclude' paths
* VS Code settings:
  * (Recommended extensions) Removed deprecated IntelliCode extension and replaced it by GitHub Copilot Chat as recommended replacement.
  * Updated 'mypy-type-checker.reportingScope' to 'custom'.


## [0.2.3] - 2025-11-06

### Added
* Added support for Python 3.14

### Removed
* Removed support for Python 3.10

### Dependencies
* Updated to ruff>=0.14.3  (from ruff>=0.11.0)
* Updated to pyright>=1.1.407  (from pyright>=1.1.396)
* Updated to sourcery>=1.40  (from sourcery>=1.35)
* Updated to numpy>=2.3  (removed split version specifiers)
* Updated to pandas-stubs>=2.3  (from pandas-stubs>=2.2)
* Updated to torch==2.9.0  (from torch==2.6.0)
* Updated CUDA version specifier to cu128
* Updated to dictIO>=0.4.2  (from dictIO>=0.4.1)
* Updated to pytest>=8.4  (from pytest>=8.3)
* Updated to pytest-cov>=7.0  (from pytest-cov>=6.0)
* Updated to Sphinx>=8.2  (from Sphinx>=8.1)
* Updated to sphinx-argparse-cli>=1.20  (from sphinx-argparse-cli>=1.19)
* Updated to sphinx-autodoc-typehints>=3.5  (from sphinx-autodoc-typehints>=3.0)
* Updated to furo>=2025.9  (from furo>=2024.8)
* Updated to pre-commit>=4.3  (from pre-commit>=4.1)
* Updated to mypy>=1.18  (from mypy>=1.15)
* Updated to checkout@v5  (from checkout@v4)
* Updated to setup-python@v6  (from setup-python@v5)
* Updated to setup-uv@v7  (from setup-uv@v5)
* Updated to upload-artifact@v5  (from upload-artifact@v4)
* Updated to download-artifact@v5  (from download-artifact@v4)

### Changed
* pyproject.toml:
  * added required-environments to uv.tools (windows, linux)
  * updated required Python version to ">= 3.11, < 3.15"
  * updated supported Python versions to 3.11, 3.12, 3.13, 3.14
  * removed deprecated pyright setting 'reportShadowedImports'
  * removed deprecated mypy plugin 'numpy.typing.mypy_plugin'
* GitHub workflow _test.yml:
  * updated Python versions in test matrix to 3.11, 3.12, 3.13, 3.14
* GitHub workflow _test_future.yml:
  * updated Python version in test_future to 3.15.0-alpha - 3.15.0
* .pre-commit-config.yaml:
  * updated rev of pre-commit-hooks to v6.0.0
  * updated rev of ruff-pre-commit to v0.14.3
  * updated id of ruff to ruff-check
* Sphinx conf.py:
  * removed ruff rule exception on file level
* demos\folder_for_demos.py:
  * removed ruff rule exception
* .sourcery.yaml:
  * updated the lowest Python version the project supports to '3.11'

### Solved
* Resolved issues raised by `ruff` 0.14.3


## [0.2.2] - 2025-03-14

### Changed
* README.md : Added option `-U` to all calls to `uv sync`.
* GitHub workflow _test_future.yml : added a step to remove the Python upper version constraint from pyproject.toml

### Dependencies
* Updated to ruff>=0.11.0  (from ruff>=0.9.5)
* Updated to pyright>=1.1.396  (from pyright>=1.1.393)
* Updated to sourcery>=1.35  (from sourcery>=1.33)
* Updated to pre-commit>=4.1  (from pre-commit>=4.0)


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
[unreleased]: https://github.com/owner/my-package/compare/v0.2.4...HEAD
[0.2.4]: https://github.com/owner/my-package/compare/v0.2.3...v0.2.4
[0.2.3]: https://github.com/owner/my-package/compare/v0.2.2...v0.2.3
[0.2.2]: https://github.com/owner/my-package/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/owner/my-package/compare/v0.1.9...v0.2.1
[0.1.9]: https://github.com/owner/my-package/compare/v0.1.6...v0.1.9
[0.1.6]: https://github.com/owner/my-package/compare/v0.1.4...v0.1.6
[0.1.4]: https://github.com/owner/my-package/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/owner/my-package/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/owner/my-package/compare/v0.1.0...v0.1.2
[0.1.0]: https://github.com/owner/my-package/compare/v0.0.1...v0.1.0
[0.0.1]: https://github.com/owner/my-package/releases/tag/v0.0.1
[my-package]: https://github.com/owner/my-package
