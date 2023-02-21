import os
from glob import glob
from pathlib import Path
from shutil import rmtree

import pytest
from pytest import LogCaptureFixture


@pytest.fixture(scope="package", autouse=True)
def chdir():
    os.chdir(Path(__file__).parent.absolute() / "test_dicts")


mvf_dirs = [
    "cases",
    "dump",
    "logs",
    "results",
    "templates",
]
mvf_files = [
    "sampled*",
    "queueList*",
    "*.copy",
    "splash.png",
    "caseList*",
]


@pytest.fixture(autouse=True)
def default_setup_and_teardown(caplog: LogCaptureFixture):
    _remove_mvf_dirs_and_files()
    yield
    _remove_mvf_dirs_and_files()


def _remove_mvf_dirs_and_files():
    for folder in mvf_dirs:
        rmtree(folder, ignore_errors=True)
    for pattern in mvf_files:
        for file in glob(pattern):
            file = Path(file)
            file.unlink(missing_ok=True)


@pytest.fixture(autouse=True)
def setup_logging(caplog: LogCaptureFixture):
    caplog.set_level("INFO")
    caplog.clear()
