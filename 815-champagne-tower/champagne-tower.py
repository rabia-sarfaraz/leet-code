class Solution(object):
    def champagneTower(self, poured, query_row, query_glass):
        """
        :type poured: int
        :type query_row: int
        :type query_glass: int
        :rtype: float
        """
        # dp[row][glass] = amount of champagne in that glass
        dp = [[0.0] * (query_row + 1) for _ in range(query_row + 1)]
        
        dp[0][0] = float(poured)

        for r in range(query_row):
            for c in range(r + 1):
                overflow = (dp[r][c] - 1.0) / 2.0
                if overflow > 0:
                    dp[r + 1][c] += overflow
                    dp[r + 1][c + 1] += overflow

        return min(1.0, dp[query_row][query_glass])