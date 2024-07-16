class Counter:
    """
    A simple counter class that keeps track of a value and provides methods to access
    the current value and get the next value.

    Methods:
        current: Returns the current value of the counter.
        next: Returns the next value of the counter and increments the current value by 1.
    """

    def __init__(self, start: int = 0) -> None:
        self.__value = start

    @property
    def current(self):
        """
        Returns the current value of the counter.

        Returns:
            int: The current value of the counter.
        """
        return self.__value

    @property
    def next(self):
        """
        Returns the next value of the counter and increments the current value by 1.

        Returns:
            int: The next value of the counter.
        """
        self.__value += 1
        return self.__value
