class Solution(object):
    def waysToMakeFair(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        n = len(nums)

        evenSum = 0
        oddSum = 0
        for i in range(n):
            if i % 2 == 0:
                evenSum += nums[i]
            else:
                oddSum += nums[i]

        leftEven = 0
        leftOdd = 0
        ans = 0

        for i in range(n):
            if i % 2 == 0:
                evenSum -= nums[i]
            else:
                oddSum -= nums[i]

            if leftEven + oddSum == leftOdd + evenSum:
                ans += 1

            if i % 2 == 0:
                leftEven += nums[i]
            else:
                leftOdd += nums[i]

        return ans