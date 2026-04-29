from collections import defaultdict

class Solution(object):
    def maxNumberOfFamilies(self, n, reservedSeats):
        rows = defaultdict(set)

        # store reserved seats per row
        for r, c in reservedSeats:
            rows[r].add(c)

        ans = (n - len(rows)) * 2  # rows with no reservation → 2 families each

        for r in rows:
            seats = rows[r]

            left = all(x not in seats for x in [2,3,4,5])
            middle = all(x not in seats for x in [4,5,6,7])
            right = all(x not in seats for x in [6,7,8,9])

            if left and right:
                ans += 2
            elif left or middle or right:
                ans += 1

        return ans