"""Utility functions for string to integer conversion."""

import logging

__ALL__ = ["str_to_int"]

logger = logging.getLogger(__name__)


def str_to_int(value: str) -> int:
    """Convert string to integer.

    This function converts a string to an integer.
    The passed in string must represent a valid integer value.

    Parameters
    ----------
    value : str
        the string literal to be converted to integer

    Returns
    -------
    int
        the resulting integer

    Raises
    ------
    ValueError
        if conversion to integer is not possible, i.e. the string literal does not represent a valid integer number.
    """
    logger.debug(f"function str_to_int() in subpackage2 called with argument {value}")
    result: int
    try:
        result = int(value)
    except ValueError as e:
        logger.exception(f"ValueError raised in function str_to_int() in subpackage2. input was: {value}")
        raise ValueError from e
    return result
