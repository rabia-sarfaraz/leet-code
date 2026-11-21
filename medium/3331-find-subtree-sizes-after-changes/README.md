# Find Subtree Sizes After Changes

![Difficulty](https://img.shields.io/badge/Difficulty-Medium-yellow)

## Problem

You are given a tree rooted at node 0 that consists of `n` nodes numbered from `0` to `n - 1`. The tree is represented by an array `parent` of size `n`, where `parent[i]` is the parent of node `i`. Since node 0 is the root, `parent[0] == -1`.

You are also given a string `s` of length `n`, where `s[i]` is the character assigned to node `i`.

We make the following changes on the tree **one** time **simultaneously** for all nodes `x` from `1` to `n - 1`:

- Find the closest node y to node x such that y is an ancestor of x, and s[x] == s[y].
- If node y does not exist, do nothing.
- Otherwise, remove the edge between x and its current parent and make node y the new parent of x by adding an edge between them.

Return an array `answer` of size `n` where `answer[i]` is the **size** of the subtree rooted at node `i` in the **final** tree.

 

Original
Dart
**Example 1:**

**Input:** parent = [-1,0,0,1,1,1], s = "abaabc"

**Output:** [6,3,1,1,1,1]

**Explanation:**

The parent of node 3 will change from node 1 to node 0.

**Example 2:**

**Input:** parent = [-1,0,4,0,1], s = "abbba"

**Output:** [5,2,1,1,1]

**Explanation:**

The following changes will happen at the same time:

- The parent of node 4 will change from node 1 to node 0.
- The parent of node 2 will change from node 4 to node 1.

 

**Constraints:**

- n == parent.length == s.length
- 1 <= n <= 105
- 0 <= parent[i] <= n - 1 for all i >= 1.
- parent[0] == -1
- parent represents a valid tree.
- s consists only of lowercase English letters.

## Solution

**Language:** dart  
**Runtime:** 442 ms (beats 100.00%)  
**Memory:** 245.1 MB (beats 100.00%)  
**Submitted:** 2026-11-21T05:32:18.091Z  

```dart

class Solution {
  List<int> findSubtreeSizes(List<int> parent, String s) {
    int n = parent.length;

    List<List<int>> children = List.generate(
      n,
      (_) => <int>[],
    );

    for (int i = 1; i < n; i++) {
      children[parent[i]].add(i);
    }

    List<int> newParent = List.filled(n, -1);
    List<int> last = List.filled(26, -1);

    List<int> stackNode = [0];
    List<int> stackState = [0];
    List<int> stackPrev = [-1];

    // Find nearest ancestor with the same character
    while (stackNode.isNotEmpty) {
      int node = stackNode.removeLast();
      int state = stackState.removeLast();
      int prev = stackPrev.removeLast();

      int ch = s.codeUnitAt(node) - 97;

      if (state == 1) {
        last[ch] = prev;
        continue;
      }

      int previous = last[ch];

      newParent[node] = node == 0
          ? -1
          : (previous == -1 ? parent[node] : previous);

      last[ch] = node;

      stackNode.add(node);
      stackState.add(1);
      stackPrev.add(previous);

      for (int i = children[node].length - 1; i >= 0; i--) {
        stackNode.add(children[node][i]);
        stackState.add(0);
        stackPrev.add(-1);
      }
    }

    // Build the updated tree
    List<List<int>> newChildren = List.generate(
      n,
      (_) => <int>[],
    );

    for (int i = 1; i < n; i++) {
      newChildren[newParent[i]].add(i);
    }

    // Calculate subtree sizes
    List<int> order = [];
    List<int> stack = [0];

    while (stack.isNotEmpty) {
      int node = stack.removeLast();
      order.add(node);

      for (int child in newChildren[node]) {
        stack.add(child);
      }
    }

    List<int> ans = List.filled(n, 1);

    for (int i = order.length - 1; i > 0; i--) {
      int node = order[i];
      ans[newParent[node]] += ans[node];
    }

    return ans;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/find-subtree-sizes-after-changes/)