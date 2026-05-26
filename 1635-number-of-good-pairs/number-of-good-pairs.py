class Solution(object):
    def numIdenticalPairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        freq = {}
        ans = 0

        for num in nums:

            if num in freq:
                ans += freq[num]
                freq[num] += 1
            else:
                freq[num] = 1

        return ans