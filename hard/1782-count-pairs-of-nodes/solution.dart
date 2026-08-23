class Solution {
  List<int> countPairs(
      int n, List<List<int>> edges, List<int> queries) {
    
    List<int> degree = List.filled(n + 1, 0);

    // Count degree of each node
    for (var edge in edges) {
      degree[edge[0]]++;
      degree[edge[1]]++;
    }

    // Count duplicate edges between same pair
    Map<String, int> shared = {};

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      if (u > v) {
        int temp = u;
        u = v;
        v = temp;
      }

      String key = '$u,$v';
      shared[key] = (shared[key] ?? 0) + 1;
    }

    // Sorted degrees for binary search
    List<int> sortedDegree = List.from(degree.sublist(1));
    sortedDegree.sort();

    List<int> answer = [];

    for (int q in queries) {
      int count = 0;

      // Count pairs where degree[u] + degree[v] > q
      int left = 0;
      int right = n - 1;

      while (left < right) {
        if (sortedDegree[left] + sortedDegree[right] > q) {
          count += right - left;
          right--;
        } else {
          left++;
        }
      }

      // Remove pairs whose shared edges make the actual
      // condition fail.
      for (var entry in shared.entries) {
        List<String> nodes = entry.key.split(',');
        int u = int.parse(nodes[0]);
        int v = int.parse(nodes[1]);
        int common = entry.value;

        if (degree[u] + degree[v] > q &&
            degree[u] + degree[v] - common <= q) {
          count--;
        }
      }

      answer.add(count);
    }

    return answer;
  }
}