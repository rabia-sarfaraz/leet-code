class Solution(object):
    def restoreString(self, s, indices):
        """
        :type s: str
        :type indices: List[int]
        :rtype: str
        """
        n = len(s)
        ans = [''] * n

        for i in range(n):
            ans[indices[i]] = s[i]

        return ''.join(ans)