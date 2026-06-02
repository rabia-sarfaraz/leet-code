class Solution(object):
    def earliestFinishTime(self, landStartTime, landDuration, waterStartTime, waterDuration):
        """
        :type landStartTime: List[int]
        :type landDuration: List[int]
        :type waterStartTime: List[int]
        :type waterDuration: List[int]
        :rtype: int
        """

        def calc(start1, dur1, start2, dur2):
            min_end = float('inf')

            for s, d in zip(start1, dur1):
                min_end = min(min_end, s + d)

            ans = float('inf')

            for s, d in zip(start2, dur2):
                ans = min(ans, max(min_end, s) + d)

            return ans

        land_to_water = calc(
            landStartTime, landDuration,
            waterStartTime, waterDuration
        )

        water_to_land = calc(
            waterStartTime, waterDuration,
            landStartTime, landDuration
        )

        return min(land_to_water, water_to_land)