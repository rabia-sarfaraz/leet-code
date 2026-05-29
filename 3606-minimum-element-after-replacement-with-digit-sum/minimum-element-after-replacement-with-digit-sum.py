class Solution(object):
    def minElement(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        def digit_sum(n):
            s = 0
            while n > 0:
                s += n % 10
                n //= 10
            return s

        ans = float('inf')

        for num in nums:
            ans = min(ans, digit_sum(num))

        return ans
        