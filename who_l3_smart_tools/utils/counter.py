class Counter:
    def __init__(self, start: int = 0) -> None:
        self.__value = start

    @property
    def current(self):
        return self.__value

    @property
    def next(self):
        self.__value += 1
        return self.__value
