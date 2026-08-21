class Solution {
  int checkWays(List<List<int>> pairs) {
    // Adjacency sets
    Map<int, Set<int>> graph = {};

    for (var pair in pairs) {
      graph.putIfAbsent(pair[0], () => {});
      graph.putIfAbsent(pair[1], () => {});

      graph[pair[0]]!.add(pair[1]);
      graph[pair[1]]!.add(pair[0]);
    }

    int n = graph.length;

    // Root woh node hoga jo sab nodes se connected ho
    int root = -1;

    for (int node in graph.keys) {
      if (graph[node]!.length == n - 1) {
        root = node;
        break;
      }
    }

    // Root nahi mila -> impossible
    if (root == -1) {
      return 0;
    }

    int answer = 1;

    for (int node in graph.keys) {
      if (node == root) continue;

      int degree = graph[node]!.length;

      int parent = -1;
      int parentDegree = 1 << 30;

      // Aisa connected node find karo jiska degree
      // current node se >= ho aur minimum ho
      for (int neighbor in graph[node]!) {
        int neighborDegree = graph[neighbor]!.length;

        if (neighborDegree >= degree &&
            neighborDegree < parentDegree) {
          parent = neighbor;
          parentDegree = neighborDegree;
        }
      }

      if (parent == -1) {
        return 0;
      }

      // Check karo ke node ke saare neighbors
      // parent ke bhi neighbors hain
      for (int neighbor in graph[node]!) {
        if (neighbor == parent) continue;

        if (!graph[parent]!.contains(neighbor)) {
          return 0;
        }
      }

      // Agar same degree hai to multiple trees possible
      if (parentDegree == degree) {
        answer = 2;
      }
    }

    return answer;
  }
}