
class Solution {
  int shortestPath(int n, List<List<int>> edges, String labels, int k) {
    List<List<List<int>>> adj = List.generate(n, (_) => []);

    for (var e in edges) {
      adj[e[0]].add([e[1], e[2]]);
    }

    const int inf = 1 << 60;

    List<List<int>> dist = List.generate(
      n,
      (_) => List.filled(k + 1, inf),
    );

    // Custom Min Heap
    List<List<int>> heap = [];

    void push(List<int> item) {
      heap.add(item);
      int i = heap.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (heap[p][0] <= heap[i][0]) break;

        var temp = heap[p];
        heap[p] = heap[i];
        heap[i] = temp;

        i = p;
      }
    }

    List<int> pop() {
      var result = heap[0];
      var last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;
        int i = 0;

        while (true) {
          int left = 2 * i + 1;
          int right = 2 * i + 2;
          int smallest = i;

          if (left < heap.length &&
              heap[left][0] < heap[smallest][0]) {
            smallest = left;
          }

          if (right < heap.length &&
              heap[right][0] < heap[smallest][0]) {
            smallest = right;
          }

          if (smallest == i) break;

          var temp = heap[i];
          heap[i] = heap[smallest];
          heap[smallest] = temp;

          i = smallest;
        }
      }

      return result;
    }

    dist[0][1] = 0;
    push([0, 0, 1]);

    while (heap.isNotEmpty) {
      var curr = pop();

      int cost = curr[0];
      int u = curr[1];
      int count = curr[2];

      if (cost != dist[u][count]) continue;

      if (u == n - 1) return cost;

      for (var e in adj[u]) {
        int v = e[0];
        int weight = e[1];

        int nextCount =
            labels[u] == labels[v] ? count + 1 : 1;

        if (nextCount > k) continue;

        int newCost = cost + weight;

        if (newCost < dist[v][nextCount]) {
          dist[v][nextCount] = newCost;
          push([newCost, v, nextCount]);
        }
      }
    }

    return -1;
  }
}
