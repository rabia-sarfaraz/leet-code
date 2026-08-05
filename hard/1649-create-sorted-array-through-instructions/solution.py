class Solution(object):
    def createSortedArray(self, instructions):
        MOD = 10**9 + 7
        m = max(instructions)

        bit = [0] * (m + 2)

        def update(i):
            while i <= m:
                bit[i] += 1
                i += i & -i

        def query(i):
            s = 0
            while i > 0:
                s += bit[i]
                i -= i & -i
            return s

        ans = 0

        for i, x in enumerate(instructions):
            less = query(x - 1)
            greater = i - query(x)
            ans = (ans + min(less, greater)) % MOD
            update(x)

        return ans