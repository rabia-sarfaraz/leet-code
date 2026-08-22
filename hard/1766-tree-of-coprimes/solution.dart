class Solution {
  List<int> getCoprimes(
      List<int> nums, List<List<int>> edges) {
    
    int n = nums.length;

    List<List<int>> graph =
        List.generate(n, (_) => []);

    for (var edge in edges) {
      int u = edge[0];
      int v = edge[1];

      graph[u].add(v);
      graph[v].add(u);
    }

    List<int> ans = List.filled(n, -1);

    // For each value 1..50:
    // store [node, depth]
    List<List<List<int>>> paths =
        List.generate(51, (_) => []);

    int gcd(int a, int b) {
      while (b != 0) {
        int temp = a % b;
        a = b;
        b = temp;
      }
      return a;
    }

    // [node, parent, depth, state]
    // state 0 = enter, state 1 = exit
    List<List<int>> stack = [
      [0, -1, 0, 0]
    ];

    while (stack.isNotEmpty) {
      List<int> current = stack.removeLast();

      int node = current[0];
      int parent = current[1];
      int depth = current[2];
      int state = current[3];

      // EXIT
      if (state == 1) {
        paths[nums[node]].removeLast();
        continue;
      }

      // Find closest coprime ancestor
      int bestNode = -1;
      int bestDepth = -1;

      for (int value = 1; value <= 50; value++) {
        if (paths[value].isEmpty) continue;

        if (gcd(nums[node], value) == 1) {
          int candidateDepth =
              paths[value].last[1];

          if (candidateDepth > bestDepth) {
            bestDepth = candidateDepth;
            bestNode = paths[value].last[0];
          }
        }
      }

      ans[node] = bestNode;

      // Add current node
      paths[nums[node]].add([node, depth]);

      // Exit event
      stack.add([node, parent, depth, 1]);

      // Children
      for (int next in graph[node]) {
        if (next == parent) continue;

        stack.add([next, node, depth + 1, 0]);
      }
    }

    return ans;
  }
}