# Palindromic Path Queries in a Tree

![Difficulty](https://img.shields.io/badge/Difficulty-Hard-red)

## Problem

You are given an undirected tree with `n` nodes labeled 0 to `n - 1`. This is represented by a 2D array `edges` of length `n - 1`, where `edges[i] = [ui, vi]` indicates an undirected edge between nodes `ui` and `vi`.

You are also given a string `s` of length `n` consisting of lowercase English letters, where `s[i]` represents the character assigned to node `i`.

You are also given a string array `queries`, where each `queries[i]` is either:

- "update ui c": Change the character at node ui to c. Formally, update s[ui] = c.
- "query ui vi": Determine whether the string formed by the characters on the unique path from ui to vi (inclusive) can be rearranged into a palindrome.

Return a boolean array `answer`, where `answer[j]` is `true` if the `jth` query of type `"query ui vi"​​​​​​​` can be rearranged into a **palindrome**, and `false` otherwise.

 

**Example 1:**

**Input:** n = 3, edges = [[0,1],[1,2]], s = "aac", queries = ["query 0 2","update 1 b","query 0 2"]

**Output:** [true,false]

**Explanation:**

- "query 0 2": Path 0 → 1 → 2 gives "aac", which can be rearranged to form "aca", a palindrome. Thus, answer[0] = true.
- "update 1 b": Update node 1 to 'b', now s = "abc".
- "query 0 2": Path characters are "abc", which cannot be rearranged to form a palindrome. Thus, answer[1] = false.

Thus, `answer = [true, false]`.

**Example 2:**

**Input:** n = 4, edges = [[0,1],[0,2],[0,3]], s = "abca", queries = ["query 1 2","update 0 b","query 2 3","update 3 a","query 1 3"]

**Output:** [false,false,true]

**Explanation:**

- "query 1 2": Path 1 → 0 → 2 gives "bac", which cannot be rearranged to form a palindrome. Thus, answer[0] = false.
- "update 0 b": Update node 0 to 'b', now s = "bbca".
- "query 2 3": Path 2 → 0 → 3 gives "cba", which cannot be rearranged to form a palindrome. Thus, answer[1] = false.
- "update 3 a": Update node 3 to 'a', s = "bbca".
- "query 1 3": Path 1 → 0 → 3 gives "bba", which can be rearranged to form "bab", a palindrome. Thus, answer[2] = true.

Thus, `answer = [false, false, true]`.

 

**Constraints:**

- 1 <= n == s.length <= 5 * 104
- edges.length == n - 1
- edges[i] = [ui, vi]
- 0 <= ui, vi <= n - 1
- s consists of lowercase English letters.
- The input is generated such that edges represents a valid tree.
- 1 <= queries.length <= 5 * 104​​​​​​​queries[i] = "update ui c" or queries[i] = "query ui vi" 0 <= ui, vi <= n - 1 c is a lowercase English letter.

## Solution

**Language:** dart  
**Runtime:** 293 ms (beats 100.00%)  
**Memory:** 315.7 MB (beats 100.00%)  
**Submitted:** 2026-10-29T05:15:21.654Z  

```dart

class Solution {
  List<bool> palindromePath(
    int n,
    List<List<int>> edges,
    String s,
    List<String> queries,
  ) {
    List<List<int>> graph = List.generate(n, (_) => <int>[]);

    for (var edge in edges) {
      graph[edge[0]].add(edge[1]);
      graph[edge[1]].add(edge[0]);
    }

    List<int> parent = List.filled(n, -1);
    List<int> depth = List.filled(n, 0);
    List<int> order = [];
    List<int> stack = [0];

    while (stack.isNotEmpty) {
      int u = stack.removeLast();
      order.add(u);

      for (int v in graph[u]) {
        if (v == parent[u]) continue;
        parent[v] = u;
        depth[v] = depth[u] + 1;
        stack.add(v);
      }
    }

    List<int> size = List.filled(n, 1);
    List<int> heavy = List.filled(n, -1);

    for (int i = order.length - 1; i >= 0; i--) {
      int u = order[i];
      int largest = 0;

      for (int v in graph[u]) {
        if (parent[v] != u) continue;
        size[u] += size[v];

        if (size[v] > largest) {
          largest = size[v];
          heavy[u] = v;
        }
      }
    }

    List<int> head = List.filled(n, 0);
    List<int> pos = List.filled(n, 0);
    List<List<int>> chains = [[0, 0]];
    int timer = 0;

    while (chains.isNotEmpty) {
      var item = chains.removeLast();
      int u = item[0];
      int h = item[1];

      while (u != -1) {
        head[u] = h;
        pos[u] = timer++;

        for (int v in graph[u]) {
          if (parent[v] == u && v != heavy[u]) {
            chains.add([v, v]);
          }
        }

        u = heavy[u];
      }
    }

    int base = 1;
    while (base < n) {
      base *= 2;
    }

    List<int> seg = List.filled(base * 2, 0);
    List<int> chars = s.codeUnits.toList();

    int maskOf(int code) => 1 << (code - 97);

    for (int i = 0; i < n; i++) {
      seg[base + pos[i]] = maskOf(chars[i]);
    }

    for (int i = base - 1; i > 0; i--) {
      seg[i] = seg[i * 2] ^ seg[i * 2 + 1];
    }

    void update(int index, int value) {
      int p = base + index;
      seg[p] = value;
      p ~/= 2;

      while (p > 0) {
        seg[p] = seg[p * 2] ^ seg[p * 2 + 1];
        p ~/= 2;
      }
    }

    int rangeQuery(int left, int right) {
      int result = 0;
      left += base;
      right += base;

      while (left < right) {
        if (left.isOdd) {
          result ^= seg[left++];
        }

        if (right.isOdd) {
          result ^= seg[--right];
        }

        left ~/= 2;
        right ~/= 2;
      }

      return result;
    }

    int pathQuery(int u, int v) {
      int result = 0;

      while (head[u] != head[v]) {
        if (depth[head[u]] < depth[head[v]]) {
          int temp = u;
          u = v;
          v = temp;
        }

        result ^= rangeQuery(pos[head[u]], pos[u] + 1);
        u = parent[head[u]];
      }

      if (depth[u] > depth[v]) {
        int temp = u;
        u = v;
        v = temp;
      }

      result ^= rangeQuery(pos[u], pos[v] + 1);
      return result;
    }

    List<bool> answer = [];

    for (String query in queries) {
      List<String> parts = query.trim().split(RegExp(r'\s+'));

      if (parts[0] == 'update') {
        int u = int.parse(parts[1]);
        int code = parts[2].codeUnitAt(0);

        chars[u] = code;
        update(pos[u], maskOf(code));
      } else {
        int u = int.parse(parts[1]);
        int v = int.parse(parts[2]);

        int mask = pathQuery(u, v);
        answer.add((mask & (mask - 1)) == 0);
      }
    }

    return answer;
  }
}

```

---

[View on LeetCode](https://leetcode.com/problems/palindromic-path-queries-in-a-tree/)