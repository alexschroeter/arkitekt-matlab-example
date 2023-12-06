from arkitekt import register
import time
import magicapp

@register
def magic(n: int = 10) -> str:
    """Generate N Strings

    This function prints a matrix with dimensions {{n}} x {{n}}.


    Parameters
    ----------
    n : int, optional
        The size of the matrix (default 10)

    Returns
    -------
    str
        A string with a random matrix of size n x n.
    """
    app = magicapp.initialize()
    result = app.mymagic(n)
    app.exit()
    return f"{result}"
