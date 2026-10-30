# Shortest Path With At Most K Consecutive Identical Characters

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given an integer `n` representing the number of nodes in a **directed weighted** graph, numbered from 0 to `n - 1`. This is represented by a 2D integer array `edges`, where `edges[i] = [ui, vi, wi]` represents a directed edge from node `ui` to node `vi` with weight `wi`.

You are also given a string `labels` of length `n`, where `labels[i]` is the character assigned to node `i`, and an integer `k`.

Return the **minimum** **total** edge weight of a path from node 0 to node `n - 1` such that the concatenation of the labels of the nodes along the path contains **at most** `k` **consecutive** **identical** characters. If no valid path exists, return -1.

 

**Example 1:**

**Input:** n = 3, edges = [[0,1,1],[1,2,1],[0,2,3]], labels = "aab", k = 1

**Output:** 3

**Explanation:**

The optimal valid path from node 0 to node 2 is as follows:

- Use edges[2] = [0, 2, 3] to reach node 2 with a weight wi = 3.
The corresponding concatenation of labels is `"ab"`, which satisfies at most `k = 1` consecutive identical characters. Thus, the answer is 3.

**Example 2:**

**Input:** n = 3, edges = [[0,1,1],[1,2,1],[0,2,3]], labels = "aab", k = 2

**Output:** 2

**Explanation:**

The optimal valid path from node 0 to node 2 is as follows:

- Use edges[0] = [0, 1, 1] to reach node 1 with weight wi = 1.
- Use edges[1] = [1, 2, 1] to reach node 2 with weight wi = 1.
The corresponding concatenation of labels is `"aab"`, which satisfies at most `k = 2` consecutive identical characters. Thus, the answer is 2.

**Example 3:**

**Input:** n = 3, edges = [[0,1,1],[1,2,1]], labels = "aaa", k = 2

**Output:** -1

**Explanation:**

There is no valid path from node 0 to node 2 that satisfies at most `k = 2` consecutive identical characters. Thus, the answer is -1.

 

**Constraints:**

- 1 <= n == labels.length <= 5 * 104
- 0 <= edges.length <= 5 * 104
- edges[i] == [ui, vi, wi]
- 0 <= ui, vi <= n - 1
- ui != vi
- 1 <= wi <= 104
- labels consists of lowercase English letters
- 1 <= k <= 50

## Solution

**Language:** dart  
**Runtime:** 161 ms (beats 100.00%)  
**Memory:** 343.2 MB (beats 100.00%)  
**Submitted:** 2026-10-30T03:35:54.513Z  

```dart

class Solution {
  int shortestPath(int n, List<List<int>> edges, String labels, int k) {
    List<List<List<int>>> adj = List.generate(n, (_) => []);

    for (var e in edges) {
      adj[e[0]].add([e[1], e[2]]);
    }

    const int inf = 1 << 60;

    List<List<int>> dist = List.generate(
      n,
      (_) => List.filled(k + 1, inf),
    );

    // Custom Min Heap
    List<List<int>> heap = [];

    void push(List<int> item) {
      heap.add(item);
      int i = heap.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (heap[p][0] <= heap[i][0]) break;

        var temp = heap[p];
        heap[p] = heap[i];
        heap[i] = temp;

        i = p;
      }
    }

    List<int> pop() {
      var result = heap[0];
      var last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;
        int i = 0;

        while (true) {
          int left = 2 * i + 1;
          int right = 2 * i + 2;
          int smallest = i;

          if (left < heap.length &&
              heap[left][0] < heap[smallest][0]) {
            smallest = left;
          }

          if (right < heap.length &&
              heap[right][0] < heap[smallest][0]) {
            smallest = right;
          }

          if (smallest == i) break;

          var temp = heap[i];
          heap[i] = heap[smallest];
          heap[smallest] = temp;

          i = smallest;
        }
      }

      return result;
    }

    dist[0][1] = 0;
    push([0, 0, 1]);

    while (heap.isNotEmpty) {
      var curr = pop();

      int cost = curr[0];
      int u = curr[1];
      int count = curr[2];

      if (cost != dist[u][count]) continue;

      if (u == n - 1) return cost;

      for (var e in adj[u]) {
        int v = e[0];
        int weight = e[1];

        int nextCount =
            labels[u] == labels[v] ? count + 1 : 1;

        if (nextCount > k) continue;

        int newCost = cost + weight;

        if (newCost < dist[v][nextCount]) {
          dist[v][nextCount] = newCost;
          push([newCost, v, nextCount]);
        }
      }
    }

    return -1;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/shortest-path-with-at-most-k-consecutive-identical-characters/)