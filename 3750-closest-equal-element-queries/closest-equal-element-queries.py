class Solution(object):
    def solveQueries(self, nums, queries):
        from collections import defaultdict
        import bisect
        
        n = len(nums)
        
        # value -> sorted indices
        mp = defaultdict(list)
        for i, val in enumerate(nums):
            mp[val].append(i)
        
        res = []
        
        for q in queries:
            val = nums[q]
            lst = mp[val]
            
            # only one occurrence
            if len(lst) == 1:
                res.append(-1)
                continue
            
            # binary search position
            i = bisect.bisect_left(lst, q)
            
            prev = lst[(i - 1) % len(lst)]
            next_ = lst[(i + 1) % len(lst)]
            
            # circular distance
            d1 = abs(q - prev)
            d2 = abs(q - next_)
            
            d1 = min(d1, n - d1)
            d2 = min(d2, n - d2)
            
            res.append(min(d1, d2))
        
        return res