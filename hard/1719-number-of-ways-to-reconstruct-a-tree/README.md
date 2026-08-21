# Number Of Ways To Reconstruct A Tree

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an array pairs, where pairs[i] = [xi, yi], and:


	There are no duplicates.
	xi < yi


Let ways be the number of rooted trees that satisfy the following conditions:


	The tree consists of nodes whose values appeared in pairs.
	A pair [xi, yi] exists in pairs if and only if xi is an ancestor of yi or yi is an ancestor of xi.
	Note: the tree does not have to be a binary tree.


Two ways are considered to be different if there is at least one node that has different parents in both ways.

Return:


	0 if ways == 0
	1 if ways == 1
	2 if ways > 1


A rooted tree is a tree that has a single root node, and all edges are oriented to be outgoing from the root.

An ancestor of a node is any node on the path from the root to that node (excluding the node itself). The root has no ancestors.

 
Example 1:

Input: pairs = [[1,2],[2,3]]
Output: 1
Explanation: There is exactly one valid rooted tree, which is shown in the above figure.


Example 2:

Input: pairs = [[1,2],[2,3],[1,3]]
Output: 2
Explanation: There are multiple valid rooted trees. Three of them are shown in the above figures.


Example 3:

Input: pairs = [[1,2],[2,3],[2,4],[1,5]]
Output: 0
Explanation: There are no valid rooted trees.

 
Constraints:


	1 <= pairs.length <= 105
	1 <= xi < yi <= 500
	The elements in pairs are unique.

## Solution

**Language:** dart  
**Runtime:** 127 ms (beats 100.00%)  
**Memory:** 239.8 MB (beats 100.00%)  
**Submitted:** 2026-08-21T10:37:30.832Z  

```dart
class Solution {
  int checkWays(List<List<int>> pairs) {
    // Adjacency sets
    Map<int, Set<int>> graph = {};

    for (var pair in pairs) {
      graph.putIfAbsent(pair[0], () => {});
      graph.putIfAbsent(pair[1], () => {});

      graph[pair[0]]!.add(pair[1]);
      graph[pair[1]]!.add(pair[0]);
    }

    int n = graph.length;

    // Root woh node hoga jo sab nodes se connected ho
    int root = -1;

    for (int node in graph.keys) {
      if (graph[node]!.length == n - 1) {
        root = node;
        break;
      }
    }

    // Root nahi mila -> impossible
    if (root == -1) {
      return 0;
    }

    int answer = 1;

    for (int node in graph.keys) {
      if (node == root) continue;

      int degree = graph[node]!.length;

      int parent = -1;
      int parentDegree = 1 << 30;

      // Aisa connected node find karo jiska degree
      // current node se >= ho aur minimum ho
      for (int neighbor in graph[node]!) {
        int neighborDegree = graph[neighbor]!.length;

        if (neighborDegree >= degree &&
            neighborDegree < parentDegree) {
          parent = neighbor;
          parentDegree = neighborDegree;
        }
      }

      if (parent == -1) {
        return 0;
      }

      // Check karo ke node ke saare neighbors
      // parent ke bhi neighbors hain
      for (int neighbor in graph[node]!) {
        if (neighbor == parent) continue;

        if (!graph[parent]!.contains(neighbor)) {
          return 0;
        }
      }

      // Agar same degree hai to multiple trees possible
      if (parentDegree == degree) {
        answer = 2;
      }
    }

    return answer;
  }
}
```

---

[View on LeetCode](https://leetcode.com/problems/number-of-ways-to-reconstruct-a-tree/)