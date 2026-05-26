class Solution(object):
    def minDifference(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        n = len(nums)

        # We can change all elements
        if n <= 4:
            return 0

        nums.sort()

        return min(
            nums[n - 4] - nums[0],   # remove 3 largest
            nums[n - 3] - nums[1],   # remove 2 largest + 1 smallest
            nums[n - 2] - nums[2],   # remove 1 largest + 2 smallest
            nums[n - 1] - nums[3]    # remove 3 smallest
        )