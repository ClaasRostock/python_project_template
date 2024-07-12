# Changelog

All notable changes to the [my-package] project will be documented in this file.<br>
The changelog format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Dependencies
* updated to black[jupyter]==24.4  (from black[jupyter]==24.1)
* updated to ruff==0.5.1  (from ruff==0.5.1)
* updated to pyright==1.1.371  (from pyright==1.1.371)
* updated to sourcery==1.21  (from sourcery==1.16)
* updated to dictIO>=0.3.4  (from dictIO>=0.3.4)
* updated to pytest>=8.2  (from pytest>=8.2)
* updated to pytest-cov>=5.0  (from pytest-cov>=5.0)
* updated to Sphinx>=7.3  (from Sphinx>=7.3)
* updated to sphinx-argparse-cli>=1.16  (from sphinx-argparse-cli>=1.15)
* updated to myst-parser>=3.0  (from myst-parser>=3.0)
* updated to furo>=2024.5  (from furo>=2024.4)
* updated to setup-python@v5  (from setup-python@v5)
* updated to actions-gh-pages@v4  (from actions-gh-pages@v4)
* updated to upload-artifact@v4  (from upload-artifact@v4)

### Dependencies
* updated to ruff==0.5.1  (from ruff==0.5.1)
* updated to pyright==1.1.371  (from pyright==1.1.371)
* updated to setup-python@v5  (from setup-python@v5)
* updated to actions-gh-pages@v4  (from actions-gh-pages@v4)
* updated to upload-artifact@v4  (from upload-artifact@v4)

### Dependencies
* updated to ruff==0.5.1  (from ruff==0.5.1)
* updated to pyright==1.1.371  (from pyright==1.1.371)
* updated to sourcery==1.21  (from sourcery==1.21)
* updated to pytest>=8.2  (from pytest>=8.2)
* updated to pytest-cov>=5.0  (from pytest-cov>=5.0)
* updated to Sphinx>=7.3  (from Sphinx>=7.3)
* updated to sphinx-argparse-cli>=1.16  (from sphinx-argparse-cli>=1.16)
* updated to myst-parser>=3.0  (from myst-parser>=3.0)
* updated to furo>=2024.5  (from furo>=2024.5)

### Changed
* replaced black formatter with ruff formatter

### Dependencies
* updated to ruff==0.5.1  (from ruff==0.5.1)
* updated to pyright==1.1.371  (from pyright==1.1.371)
* removed black

### Changed
* Changed publishing workflow to use OpenID Connect (Trusted Publisher Management) when publishing to PyPI
* Updated copyright statement
* VS Code settings: Turned off automatic venv activation

### Dependencies
* updated to dictIO>=0.3.4  (from dictIO>=0.3.4)

### Added
* README.md : Under `Development Setup`, added a step to install current package in "editable" mode, using the pip install -e option.
This removes the need to manually add /src to the PythonPath environment variable in order for debugging and tests to work.

### Removed
* VS Code settings: Removed the setting which added the /src folder to PythonPath. This is no longer necessary. Installing the project itself as a package in "editable" mode, using the pip install -e option, solves the issue and removes the need to manually add /src to the PythonPath environment variable.


## [0.1.6] - 2024-02-20

### Changed
* Moved all project configuration from setup.cfg to pyproject.toml
* Moved all tox configuration from setup.cfg to tox.ini.
* Moved pytest configuration from pyproject.toml to pytest.ini
* Deleted setup.cfg

### Dependencies
* updated to black[jupyter]==24.4  (from black[jupyter]==24.4)
* updated to ruff==0.5.1  (from ruff==0.5.1)
* updated to pyright==1.1.371  (from pyright==1.1.371)
* updated to sourcery==1.21  (from sourcery==1.21)
* updated to dictIO>=0.3.4  (from dictIO>=0.3.4)


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
[unreleased]: https://github.com/Owner/my-package/compare/v0.1.6...HEAD
[0.1.6]: https://github.com/Owner/my-package/releases/tag/v0.1.4...v0.1.6
[0.1.4]: https://github.com/Owner/my-package/releases/tag/v0.1.3...v0.1.4
[0.1.3]: https://github.com/Owner/my-package/releases/tag/v0.1.2...v0.1.3
[0.1.2]: https://github.com/Owner/my-package/releases/tag/v0.1.0...v0.1.2
[0.1.0]: https://github.com/Owner/my-package/releases/tag/v0.0.1...v0.1.0
[0.0.1]: https://github.com/Owner/my-package/releases/tag/v0.0.1
[my-package]: https://github.com/Owner/my-package
