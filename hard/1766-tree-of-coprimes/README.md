# Tree of Coprimes

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

There is a tree (i.e., a connected, undirected graph that has no cycles) consisting of n nodes numbered from 0 to n - 1 and exactly n - 1 edges. Each node has a value associated with it, and the root of the tree is node 0.

To represent this tree, you are given an integer array nums and a 2D array edges. Each nums[i] represents the ith node's value, and each edges[j] = [uj, vj] represents an edge between nodes uj and vj in the tree.

Two values x and y are coprime if gcd(x, y) == 1 where gcd(x, y) is the greatest common divisor of x and y.

An ancestor of a node i is any other node on the shortest path from node i to the root. A node is not considered an ancestor of itself.

Return an array ans of size n, where ans[i] is the closest ancestor to node i such that nums[i] and nums[ans[i]] are coprime, or -1 if there is no such ancestor.

 
Example 1:



Input: nums = [2,3,3,2], edges = [[0,1],[1,2],[1,3]]
Output: [-1,0,0,1]
Explanation: In the above figure, each node's value is in parentheses.
- Node 0 has no coprime ancestors.
- Node 1 has only one ancestor, node 0. Their values are coprime (gcd(2,3) == 1).
- Node 2 has two ancestors, nodes 1 and 0. Node 1's value is not coprime (gcd(3,3) == 3), but node 0's
  value is (gcd(2,3) == 1), so node 0 is the closest valid ancestor.
- Node 3 has two ancestors, nodes 1 and 0. It is coprime with node 1 (gcd(3,2) == 1), so node 1 is its
  closest valid ancestor.


Example 2:



Input: nums = [5,6,10,2,3,6,15], edges = [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]]
Output: [-1,0,-1,0,0,0,-1]


 
Constraints:


	nums.length == n
	1 <= nums[i] <= 50
	1 <= n <= 105
	edges.length == n - 1
	edges[j].length == 2
	0 <= uj, vj < n
	uj != vj

## Solution

**Language:** dart  
**Runtime:** 224 ms (beats 100.00%)  
**Memory:** 263.5 MB (beats 100.00%)  
**Submitted:** 2026-08-22T04:04:32.861Z  

```dart
class Solution {
  List<int> getCoprimes(
      List<int> nums, List<List<int>> edges) {
    
    int n = nums.length;

    List<List<int>> graph =
        List.generate(n, (_) => []);

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      graph[u].add(v);
      graph[v].add(u);
    }

    List<int> ans = List.filled(n, -1);

    // For each value 1..50:
    // store [node, depth]
    List<List<List<int>>> paths =
        List.generate(51, (_) => []);

    int gcd(int a, int b) {
      while (b != 0) {
        int temp = a % b;
        a = b;
        b = temp;
      }
      return a;
    }

    // [node, parent, depth, state]
    // state 0 = enter, state 1 = exit
    List<List<int>> stack = [
      [0, -1, 0, 0]
    ];

    while (stack.isNotEmpty) {
      List<int> current = stack.removeLast();

      int node = current[0];
      int parent = current[1];
      int depth = current[2];
      int state = current[3];

      // EXIT
      if (state == 1) {
        paths[nums[node]].removeLast();
        continue;
      }

      // Find closest coprime ancestor
      int bestNode = -1;
      int bestDepth = -1;

      for (int value = 1; value <= 50; value++) {
        if (paths[value].isEmpty) continue;

        if (gcd(nums[node], value) == 1) {
          int candidateDepth =
              paths[value].last[1];

          if (candidateDepth > bestDepth) {
            bestDepth = candidateDepth;
            bestNode = paths[value].last[0];
          }
        }
      }

      ans[node] = bestNode;

      // Add current node
      paths[nums[node]].add([node, depth]);

      // Exit event
      stack.add([node, parent, depth, 1]);

      // Children
      for (int next in graph[node]) {
        if (next == parent) continue;

        stack.add([next, node, depth + 1, 0]);
      }
    }

    return ans;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/tree-of-coprimes/)