# mypackage
mypackage is an example package

mypackage supports
* ..


## Installation

```sh
pip install mypackage
```

## Usage Example

API:

```py
from mypackage import ...
```

CLI:

```sh
mypackage ...
```

_For more examples and usage, please refer to mypackage's [documentation][mypackage_docs]._

## Development Setup

1. Install Python 3.9 or higher, i.e. [Python 3.10](https://www.python.org/downloads/release/python-3104/) or [Python 3.11](https://www.python.org/downloads/release/python-3114/)

2. Update pip and setuptools:

    ```sh
    python -m pip install --upgrade pip setuptools
    ```

3. git clone the mypackage repository into your local development directory:

    ```sh
    git clone https://github.com/dnv-innersource/mypackage path/to/your/dev/mypackage
    ```

4. In the mypackage root folder:

    Create a Python virtual environment:

    ```sh
    python -m venv .venv
    ```

    Activate the virtual environment:

    ..on Windows:

    ```sh
    > .venv\Scripts\activate.bat
    ```

    ..on Linux:

    ```sh
    source .venv/bin/activate
    ```

    Update pip and setuptools:

    ```sh
    (.venv) $ python -m pip install --upgrade pip setuptools
    ```

    (Optional) If you want PyTorch cuda support on your local machine
    (i.e. to use your GPU for torch operations), you should preferably install PyTorch with cuda support first, before installing all other dependendencies.
    On the official [PyTorch website](https://pytorch.org/get-started/locally/)
    you can generate a pip install command matching your local machine's operating system, using a wizard.
    If you are on Windows, the resulting pip install command will most likely look something like this:

    ```sh
    (.venv) $ pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
    ```

    _Hint:_ If you are unsure which cuda version to indicate in above `pip install .. /cuXXX` command, you can use the shell command `nvidia-smi` on your local system to find out the cuda version supported by the current graphics driver installed on your system. When then generating the `pip install` command with the wizard from the [PyTorch website](https://pytorch.org/get-started/locally/), select the cuda version that matches the major version of what your graphics driver supports (major version must match, minor version may deviate).

    Install mypackage's dependencies. <br>

    ```sh
    (.venv) $ pip install -r requirements-dev.txt
    ```
    This should return without errors.

    Finally, install mypackage itself, yet not as a regular package but as an _editable_ package instead, using the pip install option -e:
    ```sh
    (.venv) $ pip install -e .
    ```

5. Test that the installation works (in the mypackage root folder):

    ```sh
    (.venv) $ pytest .
    ```

## Meta

Copyright (c) 2023 [Author One](https://github.com/AuthorOne)

Author One - [@LinkedIn](https://www.linkedin.com/in/authorone) - author.one@xyz.com

Author Two - [@LinkedIn](https://www.linkedin.com/in/authortwo) - author.two@xyz.com

Author Three - [@LinkedIn](https://www.linkedin.com/in/authorthree) - author.three@xyz.com

@TODO: (1) Adapt to chosen license (or delete if no license is applied). <br>
@TODO: (2) Adapt or delete the license file (LICENSE.md) <br>
@TODO: (3) Adapt or delete the license entry in setup.cfg <br>
Distributed under the MIT license. See [LICENSE](LICENSE.md) for more information.

[https://github.com/AuthorOne/mypackage](https://github.com/AuthorOne/mypackage)

## Contributing

1. Fork it (<https://github.com/AuthorOne/mypackage/fork>)
2. Create your branch (`git checkout -b my-branch-name`)
3. Commit your changes (`git commit -am 'place a descriptive commit message here'`)
4. Push to the branch (`git push origin my-branch-name`)
5. Create a new Pull Request in GitHub

For your contribution, please make sure you follow the [STYLEGUIDE](STYLEGUIDE.md) before creating the Pull Request.

<!-- Markdown link & img dfn's -->
[mypackage_docs]: https://AuthorOne.github.io/mypackage/README.html
