class Solution(object):
    def getMaxGridHappiness(self, m, n, introvertsCount, extrovertsCount):
        M = 3 ** n

        bits = [[0] * n for _ in range(M)]
        ix = [0] * M
        ex = [0] * M
        score = [0] * M

        def pair(a, b):
            if a == 0 or b == 0:
                return 0
            if a == 1 and b == 1:
                return -60
            if a == 2 and b == 2:
                return 40
            return -10

        for mask in range(M):
            x = mask
            for i in range(n):
                bits[mask][i] = x % 3
                x //= 3

            s = 0
            for i in range(n):
                if bits[mask][i] == 1:
                    ix[mask] += 1
                    s += 120
                elif bits[mask][i] == 2:
                    ex[mask] += 1
                    s += 40

                if i:
                    s += pair(bits[mask][i], bits[mask][i - 1])

            score[mask] = s

        inter = [[0] * M for _ in range(M)]
        for a in range(M):
            for b in range(M):
                t = 0
                for i in range(n):
                    t += pair(bits[a][i], bits[b][i])
                inter[a][b] = t

        memo = {}

        def dfs(r, prev, intro, ext):
            if r == m:
                return 0

            key = (r, prev, intro, ext)
            if key in memo:
                return memo[key]

            ans = 0
            for cur in range(M):
                if ix[cur] <= intro and ex[cur] <= ext:
                    ans = max(
                        ans,
                        score[cur]
                        + inter[prev][cur]
                        + dfs(r + 1, cur, intro - ix[cur], ext - ex[cur])
                    )

            memo[key] = ans
            return ans

        return dfs(0, 0, introvertsCount, extrovertsCount)