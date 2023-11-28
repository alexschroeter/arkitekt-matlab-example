from arkitekt import register
import time
import magicapp

@register
def magicapp(n: int = 10) -> str:
    """Generate N Strings

    This function generates {{n}} strings with a {{timeout}} ms timeout between each string


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
    result = app.mymagic(5)
    yield f"{result}"
    app.exit()

