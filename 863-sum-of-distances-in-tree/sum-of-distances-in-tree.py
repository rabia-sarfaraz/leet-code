class Solution(object):
    def sumOfDistancesInTree(self, n, edges):
        from collections import defaultdict

        graph = defaultdict(list)

        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)

        count = [1] * n   # subtree size
        res = [0] * n     # answer

        # DFS 1: postorder
        def dfs1(node, parent):
            for nei in graph[node]:
                if nei == parent:
                    continue

                dfs1(nei, node)

                count[node] += count[nei]
                res[node] += res[nei] + count[nei]

        # DFS 2: reroot
        def dfs2(node, parent):
            for nei in graph[node]:
                if nei == parent:
                    continue

                res[nei] = res[node] - count[nei] + (n - count[nei])
                dfs2(nei, node)

        dfs1(0, -1)
        dfs2(0, -1)

        return res