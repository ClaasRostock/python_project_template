# mypackage
mypackage is an example package

mypackage supports
* ..


## Installation
```sh
pip install .
```

## Usage Example

API:
~~~py
from mypackage import ...

~~~

CLI:
~~~sh
mypackage ...
~~~

_For more examples and usage, please refer to mypackage's [documentation][mypackage_docs]._


## Development Setup

1. Install Python 3.10 or higher, i.e. [Python 3.10](https://www.python.org/downloads/release/python-3104/) or [Python 3.11](https://www.python.org/downloads/release/python-3114/)

2. Update pip and setuptools:

    ~~~sh
    $ python -m pip install --upgrade pip setuptools
    ~~~

3. git clone the mypackage repository into your local development directory:

    ~~~sh
    $ git clone https://github.com/AuthorOne/mypackage path/to/your/dev/mypackage
    ~~~

4. In the mypackage root folder:

    Create a Python virtual environment:
    ~~~sh
    $ python -m venv .venv
    ~~~
    Activate the virtual environment: <br>
    ..on Windows:
    ~~~sh
    > .venv\Scripts\activate.bat
    ~~~
    ..on Linux:
    ~~~sh
    $ source .venv/bin/activate
    ~~~
    Update pip and setuptools:
    ~~~sh
    (.venv) $ python -m pip install --upgrade pip setuptools
    ~~~
    Install mypackage's dependencies:
    ~~~sh
    (.venv) $ pip install -r requirements-dev.txt
    ~~~
    <br/>


5. Setup your development environment to locate Python source codes:

    Example: Visual Studio Code (Windows) assumes the Python environment is specified in a `.env` file.
    If you are developing and running the Python code from VSCode,
    make sure to create a file named .env in your project root folder with below template content.
    Set the path for `PROJ_DIR` to where your project root folder folder is on your system.
    ~~~ini
    PROJ_DIR=<path-to-mypackage-root-dir>
    PYTHONPATH=${PROJ_DIR}/src
    ~~~
    Note: .env is intentionally included in .gitignore, such that changes in the .env file are kept locally
    and do not get commited and pushed to remote.


6. Test that the installation works (in the package root folder):
    ~~~sh
    (.venv) $ pytest .
    ~~~


## Meta

Copyright (c) 2023 [Author One](https://github.com/AuthorOne)

Author One – [@LinkedIn](https://www.linkedin.com/in/authorone) – author.one@xyz.com

Author Two – [@LinkedIn](https://www.linkedin.com/in/authortwo) – author.two@xyz.com

Author Three – [@LinkedIn](https://www.linkedin.com/in/authorthree) – author.three@xyz.com

Distributed under the MIT license. See [LICENSE](LICENSE.md) for more information.

[https://github.com/AuthorOne/mypackage](https://github.com/AuthorOne/mypackage)

## Contributing

1. Fork it (<https://github.com/AuthorOne/mypackage/fork>)
2. Create your branch (`git checkout -b my-branch-name`)
3. Commit your changes (`git commit -am 'place a descriptive commit message here'`)
4. Push to the branch (`git push origin my-branch-name`)
5. Create a new Pull Request

For your contribution, please make sure you follow the [STYLEGUIDE](STYLEGUIDE.md) before creating the Pull Request.

<!-- Markdown link & img dfn's -->
[mypackage_docs]: https://AuthorOne.github.io/mypackage/README.html
