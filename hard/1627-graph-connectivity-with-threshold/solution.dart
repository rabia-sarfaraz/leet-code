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
      parent[pa] = pb;
    }
  }

  List<bool> areConnected(int n, int threshold, List<List<int>> queries) {
    parent = List.generate(n + 1, (i) => i);

    if (threshold < n) {
      for (int i = threshold + 1; i <= n; i++) {
        for (int j = i * 2; j <= n; j += i) {
          union(i, j);
        }
      }
    }

    List<bool> ans = [];
    for (var q in queries) {
      ans.add(find(q[0]) == find(q[1]));
    }

    return ans;
  }
}