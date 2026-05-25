class Solution(object):
    def rangeSum(self, nums, n, left, right):
        """
        :type nums: List[int]
        :type n: int
        :type left: int
        :type right: int
        :rtype: int
        """

        MOD = 10**9 + 7

        subSums = []

        # Generate all subarray sums
        for i in range(n):

            curr = 0

            for j in range(i, n):
                curr += nums[j]
                subSums.append(curr)

        # Sort all sums
        subSums.sort()

        ans = 0

        # Sum from left to right (1-indexed)
        for i in range(left - 1, right):
            ans = (ans + subSums[i]) % MOD

        return ans