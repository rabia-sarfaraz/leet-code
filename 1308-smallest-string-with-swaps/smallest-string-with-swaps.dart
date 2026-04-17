class Solution {
  List<int> parent = [];

  int find(int x) {
    if (parent[x] != x) {
      parent[x] = find(parent[x]);
    }
    return parent[x];
  }

  void union(int a, int b) {
    int pa = find(a);
    int pb = find(b);
    if (pa != pb) {
      parent[pb] = pa;
    }
  }

  String smallestStringWithSwaps(String s, List<List<int>> pairs) {
    int n = s.length;
    parent = List.generate(n, (i) => i);

    // 1. Union all connected indices
    for (var p in pairs) {
      union(p[0], p[1]);
    }

    // 2. Group characters by root
    Map<int, List<int>> groups = {};
    for (int i = 0; i < n; i++) {
      int root = find(i);
      groups.putIfAbsent(root, () => []);
      groups[root]!.add(i);
    }

    List<String> res = List.filled(n, '');

    // 3. For each group → sort indices + chars
    for (var entry in groups.entries) {
      List<int> idx = entry.value;

      List<String> chars = idx.map((i) => s[i]).toList();

      idx.sort();
      chars.sort();

      for (int i = 0; i < idx.length; i++) {
        res[idx[i]] = chars[i];
      }
    }

    return res.join();
  }
}