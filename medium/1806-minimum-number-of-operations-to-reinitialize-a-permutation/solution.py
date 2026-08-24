class Solution(object):
    def reinitializePermutation(self, n):
        """
        :type n: int
        :rtype: int
        """

        # Track where element 1 moves
        pos = 1
        operations = 0

        while True:
            if pos < n // 2:
                pos = pos * 2
            else:
                pos = (pos - n // 2) * 2 + 1

            operations += 1

            if pos == 1:
                return operations