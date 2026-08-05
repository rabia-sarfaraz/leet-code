class OrderedStream(object):

    def __init__(self, n):
        """
        :type n: int
        """
        self.stream = [""] * (n + 1)
        self.ptr = 1

    def insert(self, idKey, value):
        """
        :type idKey: int
        :type value: str
        :rtype: List[str]
        """
        self.stream[idKey] = value
        res = []

        while self.ptr < len(self.stream) and self.stream[self.ptr] != "":
            res.append(self.stream[self.ptr])
            self.ptr += 1

        return res


# Your OrderedStream object will be instantiated and called as such:
# obj = OrderedStream(n)
# param_1 = obj.insert(idKey, value)