class Solution(object):
    def getKth(self, lo, hi, k):
        memo = {}

        def power(x):
            if x in memo:
                return memo[x]

            if x == 1:
                return 0

            if x % 2 == 0:
                memo[x] = 1 + power(x // 2)
            else:
                memo[x] = 1 + power(3 * x + 1)

            return memo[x]

        arr = []

        for i in range(lo, hi + 1):
            arr.append((power(i), i))

        arr.sort()

        return arr[k - 1][1]