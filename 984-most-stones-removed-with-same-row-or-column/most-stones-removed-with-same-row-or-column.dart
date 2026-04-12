class Solution {
  late List<int> parent;
  late List<int> rank;

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

    if (rank[pa] < rank[pb]) {
      parent[pa] = pb;
    } else if (rank[pa] > rank[pb]) {
      parent[pb] = pa;
    } else {
      parent[pb] = pa;
      rank[pa]++;
    }
  }

  int removeStones(List<List<int>> stones) {
    int n = stones.length;

    parent = List.generate(n, (i) => i);
    rank = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if (stones[i][0] == stones[j][0] ||
            stones[i][1] == stones[j][1]) {
          union(i, j);
        }
      }
    }

    Set<int> roots = {};

    for (int i = 0; i < n; i++) {
      roots.add(find(i));
    }

    return n - roots.length;
  }
}