from collections import Counter

class Solution(object):
    def maximumLength(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        cnt = Counter(nums)
        ans = 1

        if 1 in cnt:
            ans = cnt[1] if cnt[1] % 2 == 1 else cnt[1] - 1

        for x in list(cnt.keys()):
            if x == 1:
                continue

            cur = x
            length = 0

            while cnt.get(cur, 0) >= 2:
                length += 2
                cur *= cur

            if cnt.get(cur, 0) == 1:
                length += 1
            else:
                length -= 1

            ans = max(ans, length)

        return ans