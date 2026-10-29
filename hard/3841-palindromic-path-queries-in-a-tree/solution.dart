
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
