class Solution(object):
    def findGoodStrings(self, n, s1, s2, evil):
        MOD = 10**9 + 7

        # Build LPS
        def build_lps(pattern):
            lps = [0] * len(pattern)
            j = 0
            for i in range(1, len(pattern)):
                while j > 0 and pattern[i] != pattern[j]:
                    j = lps[j - 1]
                if pattern[i] == pattern[j]:
                    j += 1
                    lps[i] = j
            return lps

        lps = build_lps(evil)

        memo = {}

        def dfs(i, evil_len, isS1, isS2):
            if evil_len == len(evil):
                return 0

            if i == n:
                return 1

            key = (i, evil_len, isS1, isS2)
            if key in memo:
                return memo[key]

            res = 0

            low = s1[i] if isS1 else 'a'
            high = s2[i] if isS2 else 'z'

            for ch_ord in range(ord(low), ord(high) + 1):
                ch = chr(ch_ord)

                j = evil_len
                while j > 0 and evil[j] != ch:
                    j = lps[j - 1]
                if evil[j] == ch:
                    j += 1

                res += dfs(
                    i + 1,
                    j,
                    isS1 and (ch == low),
                    isS2 and (ch == high)
                )

                res %= MOD

            memo[key] = res
            return res

        return dfs(0, 0, True, True)