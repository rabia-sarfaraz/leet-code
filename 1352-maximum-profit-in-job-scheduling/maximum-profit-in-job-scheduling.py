import bisect

class Solution(object):
    def jobScheduling(self, startTime, endTime, profit):
        jobs = sorted(zip(startTime, endTime, profit))
        starts = [j[0] for j in jobs]
        n = len(jobs)

        memo = {}

        def dfs(i):
            if i == n:
                return 0
            if i in memo:
                return memo[i]

            # option 1: skip job
            res = dfs(i + 1)

            # option 2: take job
            _, end, prof = jobs[i]
            nxt = bisect.bisect_left(starts, end)
            res = max(res, prof + dfs(nxt))

            memo[i] = res
            return res

        return dfs(0)