class Solution(object):
    def constructArray(self, n, k):
        res = []

        left = 1
        right = k + 1

        # build first k+1 elements carefully
        while left <= right:
            if left == right:
                res.append(left)
            else:
                res.append(left)
                res.append(right)
            left += 1
            right -= 1

        # add remaining numbers normally
        for i in range(k + 2, n + 1):
            res.append(i)

        return res