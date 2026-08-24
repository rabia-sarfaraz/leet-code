class Solution(object):
    def maxValue(self, n, index, maxSum):
        """
        :type n: int
        :type index: int
        :type maxSum: int
        :rtype: int
        """

        def side_sum(peak, length):
            # peak, peak-1, ..., 1
            if peak > length:
                low = peak - length + 1
                return (peak + low) * length // 2
            else:
                # peak, peak-1, ..., 2, 1, 1, 1...
                return peak * (peak + 1) // 2 + (length - peak)

        left = 1
        right = maxSum

        while left <= right:
            mid = (left + right) // 2

            left_sum = side_sum(mid - 1, index)
            right_sum = side_sum(mid - 1, n - index - 1)

            total = left_sum + mid + right_sum

            if total <= maxSum:
                left = mid + 1
            else:
                right = mid - 1

        return right