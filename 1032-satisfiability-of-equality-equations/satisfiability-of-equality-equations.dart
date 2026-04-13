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
    if (pa != pb) {
      parent[pa] = pb;
    }
  }

  bool equationsPossible(List<String> equations) {
    // initialize parent
    for (int i = 0; i < 26; i++) {
      parent[i] = i;
    }

    // step 1: process "=="
    for (String eq in equations) {
      if (eq[1] == '=') {
        int a = eq.codeUnitAt(0) - 97;
        int b = eq.codeUnitAt(3) - 97;
        union(a, b);
      }
    }

    // step 2: check "!="
    for (String eq in equations) {
      if (eq[1] == '!') {
        int a = eq.codeUnitAt(0) - 97;
        int b = eq.codeUnitAt(3) - 97;
        if (find(a) == find(b)) return false;
      }
    }

    return true;
  }
}