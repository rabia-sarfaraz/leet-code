# Count Subtrees With Max Distance Between Cities

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

There are n cities numbered from 1 to n. You are given an array edges of size n-1, where edges[i] = [ui, vi] represents a bidirectional edge between cities ui and vi. There exists a unique path between each pair of cities. In other words, the cities form a tree.

A subtree is a subset of cities where every city is reachable from every other city in the subset, where the path between each pair passes through only the cities from the subset. Two subtrees are different if there is a city in one subtree that is not present in the other.

For each d from 1 to n-1, find the number of subtrees in which the maximum distance between any two cities in the subtree is equal to d.

Return an array of size n-1 where the dth element (1-indexed) is the number of subtrees in which the maximum distance between any two cities is equal to d.

Notice that the distance between the two cities is the number of edges in the path between them.

 
Example 1:



Input: n = 4, edges = [[1,2],[2,3],[2,4]]
Output: [3,4,0]
Explanation:
The subtrees with subsets {1,2}, {2,3} and {2,4} have a max distance of 1.
The subtrees with subsets {1,2,3}, {1,2,4}, {2,3,4} and {1,2,3,4} have a max distance of 2.
No subtree has two nodes where the max distance between them is 3.


Example 2:

Input: n = 2, edges = [[1,2]]
Output: [1]


Example 3:

Input: n = 3, edges = [[1,2],[2,3]]
Output: [2,1]


 
Constraints:


	2 <= n <= 15
	edges.length == n-1
	edges[i].length == 2
	1 <= ui, vi <= n
	All pairs (ui, vi) are distinct.

## Solution

**Language:** C++  
**Runtime:** 211 ms (beats 37.76%)  
**Memory:** 315.1 MB (beats 26.57%)  
**Submitted:** 2026-07-27T06:21:12.990Z  

```cpp
class Solution {
public:
    vector<int> countSubgraphsForEachDiameter(int n, vector<vector<int>>& edges) {
        vector<vector<int>> g(n);
        for (auto &e : edges) {
            int u = e[0] - 1;
            int v = e[1] - 1;
            g[u].push_back(v);
            g[v].push_back(u);
        }

        vector<int> ans(n - 1);

        for (int mask = 1; mask < (1 << n); mask++) {
            if (__builtin_popcount(mask) < 2) continue;

            int start = __builtin_ctz(mask);

            auto first = bfs(start, mask, g);
            if (first.visited != __builtin_popcount(mask)) continue;

            auto second = bfs(first.node, mask, g);
            if (second.dist > 0)
                ans[second.dist - 1]++;
        }

        return ans;
    }

private:
    struct Result {
        int node;
        int dist;
        int visited;
    };

    Result bfs(int start, int mask, vector<vector<int>>& g) {
        int n = g.size();
        vector<int> dist(n, -1);
        queue<int> q;

        q.push(start);
        dist[start] = 0;

        int far = start;
        int visited = 0;

        while (!q.empty()) {
            int u = q.front();
            q.pop();
            visited++;

            if (dist[u] > dist[far]) far = u;

            for (int v : g[u]) {
                if ((mask & (1 << v)) && dist[v] == -1) {
                    dist[v] = dist[u] + 1;
                    q.push(v);
                }
            }
        }

        return {far, dist[far], visited};
    }
};
```

---

[View on LeetCode](https://leetcode.com/problems/count-subtrees-with-max-distance-between-cities/)