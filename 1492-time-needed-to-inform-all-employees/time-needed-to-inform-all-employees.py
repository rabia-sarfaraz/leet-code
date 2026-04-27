from collections import defaultdict

class Solution(object):
    def numOfMinutes(self, n, headID, manager, informTime):
        """
        :type n: int
        :type headID: int
        :type manager: List[int]
        :type informTime: List[int]
        :rtype: int
        """
        tree = defaultdict(list)

        for emp in range(n):
            if manager[emp] != -1:
                tree[manager[emp]].append(emp)

        def dfs(node):
            max_time = 0

            for child in tree[node]:
                max_time = max(max_time, dfs(child))

            return informTime[node] + max_time

        return dfs(headID)