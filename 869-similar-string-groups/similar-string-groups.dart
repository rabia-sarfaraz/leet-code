class Solution {
  int numSimilarGroups(List<String> strs) {
    int n = strs.length;

    List<int> parent = List.generate(n, (i) => i);

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

    bool isSimilar(String a, String b) {
      int diff = 0;
      for (int i = 0; i < a.length; i++) {
        if (a[i] != b[i]) diff++;
        if (diff > 2) return false;
      }
      return true;
    }

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if (isSimilar(strs[i], strs[j])) {
          union(i, j);
        }
      }
    }

    Set<int> groups = {};
    for (int i = 0; i < n; i++) {
      groups.add(find(i));
    }

    return groups.length;
  }
}