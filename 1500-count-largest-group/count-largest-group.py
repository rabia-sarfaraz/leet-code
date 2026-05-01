class Solution(object):
    def countLargestGroup(self, n):
        from collections import defaultdict
        
        groups = defaultdict(int)

        # Step 1: group by digit sum
        for i in range(1, n + 1):
            digit_sum = sum(int(d) for d in str(i))
            groups[digit_sum] += 1

        # Step 2: find max group size
        max_size = max(groups.values())

        # Step 3: count groups with max size
        count = sum(1 for v in groups.values() if v == max_size)

        return count