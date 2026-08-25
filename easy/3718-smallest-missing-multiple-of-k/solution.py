class Solution(object):
    def missingMultiple(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        nums_set = set(nums)

        multiple = k

        while multiple in nums_set:
            multiple += k

        return multiple