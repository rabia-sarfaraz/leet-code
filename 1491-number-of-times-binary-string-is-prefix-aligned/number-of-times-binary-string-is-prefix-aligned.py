class Solution(object):
    def numTimesAllBlue(self, flips):
        """
        :type flips: List[int]
        :rtype: int
        """
        ans = 0
        mx = 0

        for i, flip in enumerate(flips, 1):
            mx = max(mx, flip)

            if mx == i:
                ans += 1

        return ans