class Solution(object):
    def decrypt(self, code, k):
        """
        :type code: List[int]
        :type k: int
        :rtype: List[int]
        """
        n = len(code)
        ans = [0] * n

        if k == 0:
            return ans

        if k > 0:
            window = sum(code[1:k + 1])
            for i in range(n):
                ans[i] = window
                window -= code[(i + 1) % n]
                window += code[(i + k + 1) % n]
        else:
            k = -k
            window = sum(code[n - k:])
            for i in range(n):
                ans[i] = window
                window -= code[(i - k) % n]
                window += code[i]

        return ans