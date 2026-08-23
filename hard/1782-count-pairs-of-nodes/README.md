# Count Pairs Of Nodes

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an undirected graph defined by an integer n, the number of nodes, and a 2D integer array edges, the edges in the graph, where edges[i] = [ui, vi] indicates that there is an undirected edge between ui and vi. You are also given an integer array queries.

Let incident(a, b) be defined as the number of edges that are connected to either node a or b.

The answer to the jth query is the number of pairs of nodes (a, b) that satisfy both of the following conditions:


	a < b
	incident(a, b) > queries[j]


Return an array answers such that answers.length == queries.length and answers[j] is the answer of the jth query.

Note that there can be multiple edges between the same two nodes.

 
Example 1:

Input: n = 4, edges = [[1,2],[2,4],[1,3],[2,3],[2,1]], queries = [2,3]
Output: [6,5]
Explanation: The calculations for incident(a, b) are shown in the table above.
The answers for each of the queries are as follows:
- answers[0] = 6. All the pairs have an incident(a, b) value greater than 2.
- answers[1] = 5. All the pairs except (3, 4) have an incident(a, b) value greater than 3.


Example 2:

Input: n = 5, edges = [[1,5],[1,5],[3,4],[2,5],[1,3],[5,1],[2,3],[2,5]], queries = [1,2,3,4,5]
Output: [10,10,9,8,6]


 
Constraints:


	2 <= n <= 2 * 104
	1 <= edges.length <= 105
	1 <= ui, vi <= n
	ui != vi
	1 <= queries.length <= 20
	0 <= queries[j] < edges.length

## Solution

**Language:** dart  
**Runtime:** 813 ms (beats 100.00%)  
**Memory:** 304.8 MB (beats 100.00%)  
**Submitted:** 2026-08-23T05:31:00.541Z  

```dart
class Solution {
  List<int> countPairs(
      int n, List<List<int>> edges, List<int> queries) {
    
    List<int> degree = List.filled(n + 1, 0);

    // Count degree of each node
    for (var edge in edges) {
      degree[edge[0]]++;
      degree[edge[1]]++;
    }

    // Count duplicate edges between same pair
    Map<String, int> shared = {};

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      if (u > v) {
        int temp = u;
        u = v;
        v = temp;
      }

      String key = '$u,$v';
      shared[key] = (shared[key] ?? 0) + 1;
    }

    // Sorted degrees for binary search
    List<int> sortedDegree = List.from(degree.sublist(1));
    sortedDegree.sort();

    List<int> answer = [];

    for (int q in queries) {
      int count = 0;

      // Count pairs where degree[u] + degree[v] > q
      int left = 0;
      int right = n - 1;

      while (left < right) {
        if (sortedDegree[left] + sortedDegree[right] > q) {
          count += right - left;
          right--;
        } else {
          left++;
        }
      }

      // Remove pairs whose shared edges make the actual
      // condition fail.
      for (var entry in shared.entries) {
        List<String> nodes = entry.key.split(',');
        int u = int.parse(nodes[0]);
        int v = int.parse(nodes[1]);
        int common = entry.value;

        if (degree[u] + degree[v] > q &&
            degree[u] + degree[v] - common <= q) {
          count--;
        }
      }

      answer.add(count);
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/count-pairs-of-nodes/)