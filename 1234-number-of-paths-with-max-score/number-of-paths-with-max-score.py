class Solution(object):
    def pathsWithMaxScore(self, board):
        n = len(board)
        MOD = 10**9 + 7

        dp = [[[-1, 0] for _ in range(n)] for _ in range(n)]

        dp[n-1][n-1] = [0, 1]  # (score, ways)

        def get_val(c):
            if c in "SES":
                return 0
            return int(c)

        for i in range(n-1, -1, -1):
            for j in range(n-1, -1, -1):
                if board[i][j] == 'X' or (i == n-1 and j == n-1):
                    continue

                best = -1
                ways = 0

                for ni, nj in [(i+1,j), (i,j+1), (i+1,j+1)]:
                    if 0 <= ni < n and 0 <= nj < n:
                        if dp[ni][nj][0] == -1:
                            continue

                        score = dp[ni][nj][0]
                        if score > best:
                            best = score
                            ways = dp[ni][nj][1]
                        elif score == best:
                            ways = (ways + dp[ni][nj][1]) % MOD

                if best != -1:
                    dp[i][j] = [best + get_val(board[i][j]), ways]

        return dp[0][0] if dp[0][0][0] != -1 else [0, 0]