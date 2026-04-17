from collections import Counter

class Solution(object):
    def balancedString(self, s):
        n = len(s)
        target = n // 4
        
        count = Counter(s)
        
        # already balanced
        if all(count[c] == target for c in "QWER"):
            return 0
        
        res = n
        left = 0

        for right in range(n):
            count[s[right]] -= 1

            # shrink window if valid
            while left < n and all(count[c] <= target for c in "QWER"):
                res = min(res, right - left + 1)
                count[s[left]] += 1
                left += 1

        return res