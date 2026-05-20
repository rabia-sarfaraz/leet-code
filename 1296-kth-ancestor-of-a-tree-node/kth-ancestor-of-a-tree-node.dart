class TreeAncestor {
  late List<List<int>> up;
  late int LOG;

  TreeAncestor(int n, List<int> parent) {
    LOG = 0;

    while ((1 << LOG) <= n) {
      LOG++;
    }

    up = List.generate(LOG, (_) => List.filled(n, -1));

    // 2^0 ancestor
    for (int i = 0; i < n; i++) {
      up[0][i] = parent[i];
    }

    // Binary lifting table
    for (int j = 1; j < LOG; j++) {
      for (int i = 0; i < n; i++) {
        int prev = up[j - 1][i];

        if (prev != -1) {
          up[j][i] = up[j - 1][prev];
        }
      }
    }
  }

  int getKthAncestor(int node, int k) {
    for (int j = 0; j < LOG; j++) {
      if ((k & (1 << j)) != 0) {
        node = up[j][node];

        if (node == -1) return -1;
      }
    }

    return node;
  }
}

/**
 * Your TreeAncestor object will be instantiated and called as such:
 * TreeAncestor obj = TreeAncestor(n, parent);
 * int param1 = obj.getKthAncestor(node,k);
 */