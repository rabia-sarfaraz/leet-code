class Solution {
  List<bool> distanceLimitedPathsExist(
      int n, List<List<int>> edgeList, List<List<int>> queries) {

    // Edge: [u, v, weight]
    edgeList.sort((a, b) => a[2].compareTo(b[2]));

    // Query ko [u, v, limit, originalIndex] bana do
    List<List<int>> qs = [];

    for (int i = 0; i < queries.length; i++) {
      qs.add([
        queries[i][0],
        queries[i][1],
        queries[i][2],
        i
      ]);
    }

    // Limit ke according queries sort
    qs.sort((a, b) => a[2].compareTo(b[2]));

    List<int> parent = List.generate(n, (i) => i);
    List<int> rank = List.filled(n, 0);

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

    List<bool> ans = List.filled(queries.length, false);

    int edgeIndex = 0;

    for (var q in qs) {
      int u = q[0];
      int v = q[1];
      int limit = q[2];
      int originalIndex = q[3];

      // Sirf weight < limit wali edges add karo
      while (edgeIndex < edgeList.length &&
          edgeList[edgeIndex][2] < limit) {

        union(
          edgeList[edgeIndex][0],
          edgeList[edgeIndex][1],
        );

        edgeIndex++;
      }

      // Check whether u and v connected hain
      ans[originalIndex] = find(u) == find(v);
    }

    return ans;
  }
}