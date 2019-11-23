def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """
    return "Hello " + str(req) + ", the answer to your question is of course 42."
