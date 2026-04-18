class Solution(object):
    def findBestValue(self, arr, target):
        arr.sort()

        def compute(v):
            total = 0
            for x in arr:
                if x > v:
                    total += v
                else:
                    total += x
            return total

        left, right = 0, max(arr)
        best = 0
        min_diff = float('inf')

        while left <= right:
            mid = (left + right) // 2
            curr_sum = compute(mid)
            diff = abs(curr_sum - target)

            if diff < min_diff or (diff == min_diff and mid < best):
                min_diff = diff
                best = mid

            if curr_sum < target:
                left = mid + 1
            else:
                right = mid - 1

        return best