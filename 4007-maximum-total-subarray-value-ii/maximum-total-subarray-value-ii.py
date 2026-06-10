import heapq

class Solution(object):
    def maxTotalValue(self, nums, k):
        n = len(nums)

        LOG = (n).bit_length()

        st_max = [nums[:]]
        st_min = [nums[:]]

        j = 1
        while (1 << j) <= n:
            prev_max = st_max[j - 1]
            prev_min = st_min[j - 1]
            length = n - (1 << j) + 1

            cur_max = [0] * length
            cur_min = [0] * length

            half = 1 << (j - 1)

            for i in range(length):
                cur_max[i] = max(prev_max[i], prev_max[i + half])
                cur_min[i] = min(prev_min[i], prev_min[i + half])

            st_max.append(cur_max)
            st_min.append(cur_min)
            j += 1

        log = [0] * (n + 1)
        for i in range(2, n + 1):
            log[i] = log[i // 2] + 1

        def value(l, r):
            length = r - l + 1
            p = log[length]

            mx = max(st_max[p][l], st_max[p][r - (1 << p) + 1])
            mn = min(st_min[p][l], st_min[p][r - (1 << p) + 1])

            return mx - mn

        heap = []

        for l in range(n):
            v = value(l, n - 1)
            heapq.heappush(heap, (-v, l, n - 1))

        ans = 0

        for _ in range(k):
            v, l, r = heapq.heappop(heap)
            ans += -v

            if r > l:
                nv = value(l, r - 1)
                heapq.heappush(heap, (-nv, l, r - 1))

        return ans