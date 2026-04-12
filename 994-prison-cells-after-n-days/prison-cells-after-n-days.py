class Solution(object):
    def prisonAfterNDays(self, cells, n):
        """
        :type cells: List[int]
        :type n: int
        :rtype: List[int]
        """
        seen = {}

        while n > 0:
            state = tuple(cells)

            if state in seen:
                cycle_length = seen[state] - n
                n %= cycle_length

            seen[state] = n

            if n == 0:
                break

            n -= 1
            new = [0] * 8

            for i in range(1, 7):
                new[i] = 1 if cells[i - 1] == cells[i + 1] else 0

            cells = new

        return cells