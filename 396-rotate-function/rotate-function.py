class Solution(object):
    def maxRotateFunction(self, nums):
        n = len(nums)
        total_sum = sum(nums)

        # F(0)
        F = sum(i * num for i, num in enumerate(nums))
        max_val = F

        # Compute next rotations using formula
        for k in range(1, n):
            F = F + total_sum - n * nums[n - k]
            max_val = max(max_val, F)

        return max_val