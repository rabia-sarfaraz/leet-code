class Solution(object):
    def minOperations(self, grid, x):
        """
        :type grid: List[List[int]]
        :type x: int
        :rtype: int
        """
        nums = []

        for row in grid:
            nums.extend(row)

        rem = nums[0] % x
        for num in nums:
            if num % x != rem:
                return -1

        nums.sort()
        median = nums[len(nums) // 2]

        ops = 0
        for num in nums:
            ops += abs(num - median) // x

        return ops