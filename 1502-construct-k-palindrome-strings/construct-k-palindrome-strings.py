class Solution(object):
    def canConstruct(self, s, k):
        if k > len(s):
            return False

        from collections import Counter
        freq = Counter(s)

        odd_count = sum(1 for v in freq.values() if v % 2 == 1)

        return odd_count <= k