from collections import defaultdict

class Solution(object):
    def countSubTrees(self, n, edges, labels):
        """
        :type n: int
        :type edges: List[List[int]]
        :type labels: str
        :rtype: List[int]
        """
        
        graph = defaultdict(list)
        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)
        
        ans = [0] * n
        
        def dfs(node, parent):
            freq = [0] * 26
            
            for nei in graph[node]:
                if nei != parent:
                    child_freq = dfs(nei, node)
                    for i in range(26):
                        freq[i] += child_freq[i]
            
            idx = ord(labels[node]) - ord('a')
            freq[idx] += 1
            ans[node] = freq[idx]
            
            return freq
        
        dfs(0, -1)
        return ans