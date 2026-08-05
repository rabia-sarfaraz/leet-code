from collections import Counter

class Solution(object):
    def canDistribute(self, nums, quantity):
        """
        :type nums: List[int]
        :type quantity: List[int]
        :rtype: bool
        """
        freq = list(Counter(nums).values())
        quantity.sort(reverse=True)

        m = len(quantity)
        full = 1 << m

        subsetSum = [0] * full
        for mask in range(1, full):
            bit = mask & -mask
            idx = bit.bit_length() - 1
            subsetSum[mask] = subsetSum[mask ^ bit] + quantity[idx]

        memo = {}

        def dfs(i, mask):
            if mask == 0:
                return True
            if i == len(freq):
                return False

            if (i, mask) in memo:
                return memo[(i, mask)]

            sub = mask
            while sub:
                if subsetSum[sub] <= freq[i]:
                    if dfs(i + 1, mask ^ sub):
                        memo[(i, mask)] = True
                        return True
                sub = (sub - 1) & mask

            memo[(i, mask)] = dfs(i + 1, mask)
            return memo[(i, mask)]

        return dfs(0, full - 1)