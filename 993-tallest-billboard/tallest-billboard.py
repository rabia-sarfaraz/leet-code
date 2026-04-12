class Solution(object):
    def tallestBillboard(self, rods):
        """
        :type rods: List[int]
        :rtype: int
        """
        dp = {0: 0}  # diff -> max taller sum

        for r in rods:
            cur = dp.copy()

            for d, h in cur.items():
                # add to left
                dp[d + r] = max(dp.get(d + r, 0), h + r)

                # add to right
                dp[d - r] = max(dp.get(d - r, 0), h)

        return dp.get(0, 0)