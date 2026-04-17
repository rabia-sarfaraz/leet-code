class Solution {
  List<int> sortItems(int n, int m, List<int> group, List<List<int>> beforeItems) {
    int gid = m;

    // assign unique group to ungrouped items
    for (int i = 0; i < n; i++) {
      if (group[i] == -1) {
        group[i] = gid++;
      }
    }

    List<List<int>> itemGraph = List.generate(n, (_) => []);
    List<int> itemIndeg = List.filled(n, 0);

    List<List<int>> groupGraph = List.generate(gid, (_) => []);
    List<int> groupIndeg = List.filled(gid, 0);

    // build graphs
    for (int i = 0; i < n; i++) {
      for (int pre in beforeItems[i]) {
        itemGraph[pre].add(i);
        itemIndeg[i]++;

        if (group[pre] != group[i]) {
          groupGraph[group[pre]].add(group[i]);
          groupIndeg[group[i]]++;
        }
      }
    }

    // topo sort helper
    List<int> topoSort(List<List<int>> graph, List<int> indeg, int size) {
      List<int> q = [];
      for (int i = 0; i < size; i++) {
        if (indeg[i] == 0) q.add(i);
      }

      List<int> res = [];
      int idx = 0;

      while (idx < q.length) {
        int u = q[idx++];

        res.add(u);

        for (int v in graph[u]) {
          indeg[v]--;
          if (indeg[v] == 0) q.add(v);
        }
      }

      return res.length == size ? res : [];
    }

    List<int> groupOrder = topoSort(groupGraph, groupIndeg, gid);
    List<int> itemOrder = topoSort(itemGraph, itemIndeg, n);

    if (groupOrder.isEmpty || itemOrder.isEmpty) return [];

    // group -> items mapping
    Map<int, List<int>> groupItems = {};
    for (int item in itemOrder) {
      groupItems.putIfAbsent(group[item], () => []);
      groupItems[group[item]]!.add(item);
    }

    List<int> result = [];
    for (int g in groupOrder) {
      if (groupItems.containsKey(g)) {
        result.addAll(groupItems[g]!);
      }
    }

    return result;
  }
}