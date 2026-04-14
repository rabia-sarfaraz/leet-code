class Solution {
  List<int> parent = List.filled(26, 0);

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

    // attach larger to smaller
    if (pa < pb) {
      parent[pb] = pa;
    } else {
      parent[pa] = pb;
    }
  }

  String smallestEquivalentString(String s1, String s2, String baseStr) {
    for (int i = 0; i < 26; i++) {
      parent[i] = i;
    }

    // build DSU
    for (int i = 0; i < s1.length; i++) {
      int a = s1.codeUnitAt(i) - 97;
      int b = s2.codeUnitAt(i) - 97;
      union(a, b);
    }

    StringBuffer sb = StringBuffer();

    for (int i = 0; i < baseStr.length; i++) {
      int ch = baseStr.codeUnitAt(i) - 97;
      int root = find(ch);
      sb.write(String.fromCharCode(root + 97));
    }

    return sb.toString();
  }
}