class Solution(object):
    def stoneGameV(self, stoneValue):
        """
        :type stoneValue: List[int]
        :rtype: int
        """
        n = len(stoneValue)
        A = stoneValue
        dp = [[0] * n for _ in range(n)]
        mx = [[0] * n for _ in range(n)]
        for i in range(n):
            mx[i][i] = A[i]

        for j in range(1, n):
            mid = j
            sm = A[j]
            right = 0
            for i in range(j - 1, -1, -1):
                sm += A[i]
                while (right + A[mid]) * 2 <= sm:
                    right += A[mid]
                    mid -= 1

                if right * 2 == sm:
                    dp[i][j] = mx[i][mid]
                if mid != i:
                    dp[i][j] = max(dp[i][j], mx[i][mid - 1])
                if mid != j:
                    dp[i][j] = max(dp[i][j], mx[j][mid + 1])

                mx[i][j] = max(mx[i][j - 1], dp[i][j] + sm)
                mx[j][i] = max(mx[j][i + 1], dp[i][j] + sm)

        return dp[0][n - 1]