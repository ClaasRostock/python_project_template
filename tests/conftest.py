import logging
import os
from pathlib import Path
from shutil import rmtree

import pytest
import torch
import torch.cuda

CUDA_AVAILABLE: bool = torch.cuda.is_available()

TORCH_DEVICES: list[str] = ["cuda", "cpu"] if CUDA_AVAILABLE else ["cpu"]


@pytest.fixture(scope="package", autouse=True)
def chdir() -> None:
    os.chdir(Path(__file__).parent.absolute() / "test_working_directory")


# @pytest.fixture(scope="class", autouse=True)
# def reset_torch_default_device() -> None:
#     torch.set_default_device("cpu")


@pytest.fixture(scope="class", params=TORCH_DEVICES)
def vary_torch_default_device(request: pytest.FixtureRequest):
    torch.set_default_device(request.param)  # pyright: ignore[reportUnknownMemberType]
    yield
    torch.set_default_device("cpu")  # reset to default device after test  # pyright: ignore[reportUnknownMemberType]


@pytest.fixture(scope="package", autouse=True)
def test_dir() -> Path:
    return Path(__file__).parent.absolute()


output_dirs = [
    "results",
    "data",
]
output_files = [
    "*test*.pdf",
]


@pytest.fixture(autouse=True)
def default_setup_and_teardown():
    _remove_output_dirs_and_files()
    yield
    _remove_output_dirs_and_files()


def _remove_output_dirs_and_files() -> None:
    for folder in output_dirs:
        rmtree(folder, ignore_errors=True)
    for pattern in output_files:
        for file in Path.cwd().glob(pattern):
            _file = Path(file)
            _file.unlink(missing_ok=True)


@pytest.fixture(autouse=True)
def setup_logging(caplog: pytest.LogCaptureFixture) -> None:
    caplog.set_level("INFO")
    caplog.clear()


@pytest.fixture(autouse=True)
def logger() -> logging.Logger:
    return logging.getLogger()
