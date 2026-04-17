class Solution(object):
    def maxEqualFreq(self, nums):
        from collections import defaultdict

        freq = defaultdict(int)   # number -> frequency
        count = defaultdict(int)  # frequency -> how many numbers
        res = 0
        max_freq = 0

        for i, num in enumerate(nums):
            old = freq[num]

            if old > 0:
                count[old] -= 1

            freq[num] += 1
            new = freq[num]
            count[new] += 1

            max_freq = max(max_freq, new)

            total = i + 1

            # check validity conditions
            if (
                max_freq == 1 or
                count[max_freq] * max_freq + count[max_freq - 1] * (max_freq - 1) == total and count[max_freq] == 1 or
                count[1] == 1 and count[max_freq] * max_freq + 1 == total
            ):
                res = total

        return res