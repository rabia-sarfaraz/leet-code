class Solution(object):
    def assignEdgeWeights(self, edges, queries):
        MOD = 10**9 + 7
        n = len(edges) + 1

        g = [[] for _ in range(n + 1)]
        for u, v in edges:
            g[u].append(v)
            g[v].append(u)

        LOG = 17
        while (1 << LOG) <= n:
            LOG += 1

        depth = [0] * (n + 1)
        up = [[0] * (n + 1) for _ in range(LOG)]

        stack = [(1, 0)]
        while stack:
            u, p = stack.pop()
            up[0][u] = p

            for v in g[u]:
                if v != p:
                    depth[v] = depth[u] + 1
                    stack.append((v, u))

        for j in range(1, LOG):
            for v in range(1, n + 1):
                up[j][v] = up[j - 1][up[j - 1][v]]

        def lca(a, b):
            if depth[a] < depth[b]:
                a, b = b, a

            diff = depth[a] - depth[b]
            for j in range(LOG):
                if diff & (1 << j):
                    a = up[j][a]

            if a == b:
                return a

            for j in range(LOG - 1, -1, -1):
                if up[j][a] != up[j][b]:
                    a = up[j][a]
                    b = up[j][b]

            return up[0][a]

        ans = []

        for u, v in queries:
            if u == v:
                ans.append(0)
                continue

            a = lca(u, v)
            d = depth[u] + depth[v] - 2 * depth[a]

            ans.append(pow(2, d - 1, MOD))

        return ans