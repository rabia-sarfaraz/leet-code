# Checking Existence of Edge Length Limited Paths

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

An undirected graph of n nodes is defined by edgeList, where edgeList[i] = [ui, vi, disi] denotes an edge between nodes ui and vi with distance disi. Note that there may be multiple edges between two nodes.

Given an array queries, where queries[j] = [pj, qj, limitj], your task is to determine for each queries[j] whether there is a path between pj and qj such that each edge on the path has a distance strictly less than limitj .

Return a boolean array answer, where answer.length == queries.length and the jth value of answer is true if there is a path for queries[j] is true, and false otherwise.

 
Example 1:

Input: n = 3, edgeList = [[0,1,2],[1,2,4],[2,0,8],[1,0,16]], queries = [[0,1,2],[0,2,5]]
Output: [false,true]
Explanation: The above figure shows the given graph. Note that there are two overlapping edges between 0 and 1 with distances 2 and 16.
For the first query, between 0 and 1 there is no path where each distance is less than 2, thus we return false for this query.
For the second query, there is a path (0 -> 1 -> 2) of two edges with distances less than 5, thus we return true for this query.


Example 2:

Input: n = 5, edgeList = [[0,1,10],[1,2,5],[2,3,9],[3,4,13]], queries = [[0,4,14],[1,4,13]]
Output: [true,false]
Explanation: The above figure shows the given graph.


 
Constraints:


	2 <= n <= 105
	1 <= edgeList.length, queries.length <= 105
	edgeList[i].length == 3
	queries[j].length == 3
	0 <= ui, vi, pj, qj <= n - 1
	ui != vi
	pj != qj
	1 <= disi, limitj <= 109
	There may be multiple edges between two nodes.

## Solution

**Language:** dart  
**Runtime:** 139 ms (beats 100.00%)  
**Memory:** 229.8 MB (beats 100.00%)  
**Submitted:** 2026-08-21T07:08:11.893Z  

```dart
class Solution {
  List<bool> distanceLimitedPathsExist(
      int n, List<List<int>> edgeList, List<List<int>> queries) {

    // Edge: [u, v, weight]
    edgeList.sort((a, b) => a[2].compareTo(b[2]));

    // Query ko [u, v, limit, originalIndex] bana do
    List<List<int>> qs = [];

    for (int i = 0; i < queries.length; i++) {
      qs.add([
        queries[i][0],
        queries[i][1],
        queries[i][2],
        i
      ]);
    }

    // Limit ke according queries sort
    qs.sort((a, b) => a[2].compareTo(b[2]));

    List<int> parent = List.generate(n, (i) => i);
    List<int> rank = List.filled(n, 0);

    int find(int x) {
      if (parent[x] != x) {
        parent[x] = find(parent[x]);
      }
      return parent[x];
    }

    void union(int a, int b) {
      int pa = find(a);
      int pb = find(b);

      if (pa == pb) return;

      if (rank[pa] < rank[pb]) {
        parent[pa] = pb;
      } else if (rank[pa] > rank[pb]) {
        parent[pb] = pa;
      } else {
        parent[pb] = pa;
        rank[pa]++;
      }
    }

    List<bool> ans = List.filled(queries.length, false);

    int edgeIndex = 0;

    for (var q in qs) {
      int u = q[0];
      int v = q[1];
      int limit = q[2];
      int originalIndex = q[3];

      // Sirf weight < limit wali edges add karo
      while (edgeIndex < edgeList.length &&
          edgeList[edgeIndex][2] < limit) {

        union(
          edgeList[edgeIndex][0],
          edgeList[edgeIndex][1],
        );

        edgeIndex++;
      }

      // Check whether u and v connected hain
      ans[originalIndex] = find(u) == find(v);
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/checking-existence-of-edge-length-limited-paths/)