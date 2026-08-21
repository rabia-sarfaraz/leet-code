class Solution(object):

    def getSumAbsoluteDifferences(self, nums):
        n = len(nums)
        total = sum(nums)
        left = 0
        result = []

        for i in range(n):
            right = total - left - nums[i]

            left_sum = nums[i] * i - left
            right_sum = right - nums[i] * (n - i - 1)

            result.append(left_sum + right_sum)

            left += nums[i]

        return result