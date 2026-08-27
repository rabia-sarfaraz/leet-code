class Solution(object):
    def countNicePairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        MOD = 10**9 + 7

        freq = {}
        ans = 0

        def rev(x):
            return int(str(x)[::-1])

        for num in nums:
            key = num - rev(num)

            if key in freq:
                ans = (ans + freq[key]) % MOD

            freq[key] = freq.get(key, 0) + 1

        return ans