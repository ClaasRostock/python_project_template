import logging
import os
from pathlib import Path
from typing import Union

from mypackage.subpackage1.module import int_to_str
from mypackage.subpackage2.module import str_to_int

__ALL__ = ["run_mypackage", "MyPackageProcess"]

logger = logging.getLogger(__name__)


def run(
    config_file: Union[str, os.PathLike[str]],
    option: bool = False,
):
    """Run the mypackage process.

    Run the mypackage process and .. (long description).

    Parameters
    ----------
    config_file : Union[str, os.PathLike[str]]
        file containing the mypackage configuration
    option : bool, optional
        if True, does something differently, by default False

    Raises
    ------
    FileNotFoundError
        if config_file does not exist
    """

    # Make sure config_file argument is of type Path. If not, cast it to Path type.
    config_file = config_file if isinstance(config_file, Path) else Path(config_file)

    # Check whether mypackage config file exists
    if not config_file.exists():
        logger.error(f"run_mypackage: File {config_file} not found.")
        raise FileNotFoundError(config_file)

    if option:
        msg: str = "run: 'option' is set to True. mypackage process will do something differently."
        logger.info(msg)

    process = MyPackageProcess(config_file)
    process.run()

    return


class MyPackageProcess:
    def __init__(
        self,
        config_file: Path,
    ):
        self.config_file: Path = config_file
        self._run_number: int = 0
        self.max_number_of_runs: int = 3
        self.terminate: bool = False
        self._read_config_file()
        return

    def run(self):
        """Run the mypackage process.

        Runs the mypackage process in a self-terminated loop.
        """

        # Run mypackage process until termination is flagged
        while not self.terminate:
            self._run_process()
            self.terminate = self._run_number >= self.max_number_of_runs
        return

    @property
    def run_number(self) -> int:
        """Read only property for _run_number instance variable."""
        return self._run_number

    def _run_process(self):
        """Execute a single run of the mypackage process."""
        self._run_number += 1

        logger.info(f"Start run {self._run_number}")

        # Do stuff
        _string: str = _do_cool_stuff(self._run_number)
        _number: int = _do_even_cooler_stuff(_string)
        logger.debug(f"\t _string: {_string} _number: {_number}")

        logger.info(f"Successfully finished run {self._run_number}")

        return

    def _read_config_file(self):
        """Read config file and do some set-up and configuration stuff depending on its content."""
        pass


def _do_cool_stuff(run_number: int) -> str:
    """Do cool stuff.

    Converts the passed in run number into a string.

    Parameters
    ----------
    run_number : int
        the run number

    Returns
    -------
    str
        the run number converted to string
    """
    result: str = int_to_str(run_number)
    return result


def _do_even_cooler_stuff(string: str) -> int:
    """Do even cooler stuff.

    Converts the passed in string-formatted integer back into an integer.

    Parameters
    ----------
    string : str
        the string-formatted integer to be converted back to an integer

    Returns
    -------
    int
        the resulting integer
    """
    result: int = str_to_int(string)
    return result
