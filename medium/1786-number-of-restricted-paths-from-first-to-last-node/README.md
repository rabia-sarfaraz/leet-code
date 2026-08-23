# Number of Restricted Paths From First to Last Node

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

There is an undirected weighted connected graph. You are given a positive integer n which denotes that the graph has n nodes labeled from 1 to n, and an array edges where each edges[i] = [ui, vi, weighti] denotes that there is an edge between nodes ui and vi with weight equal to weighti.

A path from node start to node end is a sequence of nodes [z0, z1, z2, ..., zk] such that z0 = start and zk = end and there is an edge between zi and zi+1 where 0 <= i <= k-1.

The distance of a path is the sum of the weights on the edges of the path. Let distanceToLastNode(x) denote the shortest distance of a path between node n and node x. A restricted path is a path that also satisfies that distanceToLastNode(zi) > distanceToLastNode(zi+1) where 0 <= i <= k-1.

Return the number of restricted paths from node 1 to node n. Since that number may be too large, return it modulo 109 + 7.

 
Example 1:

Input: n = 5, edges = [[1,2,3],[1,3,3],[2,3,1],[1,4,2],[5,2,2],[3,5,1],[5,4,10]]
Output: 3
Explanation: Each circle contains the node number in black and its distanceToLastNode value in blue. The three restricted paths are:
1) 1 --> 2 --> 5
2) 1 --> 2 --> 3 --> 5
3) 1 --> 3 --> 5


Example 2:

Input: n = 7, edges = [[1,3,1],[4,1,2],[7,3,4],[2,5,3],[5,6,1],[6,7,2],[7,5,3],[2,6,4]]
Output: 1
Explanation: Each circle contains the node number in black and its distanceToLastNode value in blue. The only restricted path is 1 --> 3 --> 7.


 
Constraints:


	1 <= n <= 2 * 104
	n - 1 <= edges.length <= 4 * 104
	edges[i].length == 3
	1 <= ui, vi <= n
	ui != vi
	1 <= weighti <= 105
	There is at most one edge between any two nodes.
	There is at least one path between any two nodes.

## Solution

**Language:** dart  
**Runtime:** 182 ms (beats 100.00%)  
**Memory:** 229.6 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:33:54.357Z  

```dart
class Solution {
  static const int MOD = 1000000007;

  int countRestrictedPaths(int n, List<List<int>> edges) {
    List<List<List<int>>> graph =
        List.generate(n + 1, (_) => []);

    for (var e in edges) {
      int u = e[0];
      int v = e[1];
      int w = e[2];

      graph[u].add([v, w]);
      graph[v].add([u, w]);
    }

    // Dijkstra from node n
    const int INF = 1 << 60;

    List<int> dist = List.filled(n + 1, INF);
    dist[n] = 0;

    // [distance, node]
    List<List<int>> heap = [
      [0, n]
    ];

    void push(int d, int node) {
      heap.add([d, node]);

      int i = heap.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (heap[p][0] <= heap[i][0]) {
          break;
        }

        var temp = heap[p];
        heap[p] = heap[i];
        heap[i] = temp;

        i = p;
      }
    }

    List<int> pop() {
      List<int> result = heap[0];
      List<int> last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;

        int i = 0;

        while (true) {
          int left = i * 2 + 1;
          int right = i * 2 + 2;
          int smallest = i;

          if (left < heap.length &&
              heap[left][0] < heap[smallest][0]) {
            smallest = left;
          }

          if (right < heap.length &&
              heap[right][0] < heap[smallest][0]) {
            smallest = right;
          }

          if (smallest == i) {
            break;
          }

          var temp = heap[i];
          heap[i] = heap[smallest];
          heap[smallest] = temp;

          i = smallest;
        }
      }

      return result;
    }

    while (heap.isNotEmpty) {
      List<int> current = pop();

      int d = current[0];
      int u = current[1];

      if (d != dist[u]) continue;

      for (var edge in graph[u]) {
        int v = edge[0];
        int w = edge[1];

        if (d + w < dist[v]) {
          dist[v] = d + w;
          push(dist[v], v);
        }
      }
    }

    // Sort nodes by shortest distance
    List<int> nodes = List.generate(n, (i) => i + 1);

    nodes.sort((a, b) => dist[a].compareTo(dist[b]));

    // dp[u] = number of restricted paths from u to n
    List<int> dp = List.filled(n + 1, 0);
    dp[n] = 1;

    // Smaller distance nodes are already calculated
    for (int u in nodes) {
      if (u == n) continue;

      int ways = 0;

      for (var edge in graph[u]) {
        int v = edge[0];

        if (dist[v] < dist[u]) {
          ways += dp[v];

          if (ways >= MOD) {
            ways -= MOD;
          }
        }
      }

      dp[u] = ways;
    }

    return dp[1];
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-restricted-paths-from-first-to-last-node/)