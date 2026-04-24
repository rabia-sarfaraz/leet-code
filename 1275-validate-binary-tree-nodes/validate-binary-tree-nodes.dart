class Solution {
  bool validateBinaryTreeNodes(int n, List<int> leftChild, List<int> rightChild) {
    List<int> indegree = List.filled(n, 0);

    // Step 1: indegree count
    for (int i = 0; i < n; i++) {
      if (leftChild[i] != -1) {
        indegree[leftChild[i]]++;
        if (indegree[leftChild[i]] > 1) return false;
      }
      if (rightChild[i] != -1) {
        indegree[rightChild[i]]++;
        if (indegree[rightChild[i]] > 1) return false;
      }
    }

    // Step 2: find root (indegree = 0)
    int root = -1;
    for (int i = 0; i < n; i++) {
      if (indegree[i] == 0) {
        if (root != -1) return false; // multiple roots
        root = i;
      }
    }

    if (root == -1) return false;

    // Step 3: BFS/DFS to check connectivity
    List<bool> visited = List.filled(n, false);

    bool dfs(int node) {
      if (node == -1) return true;
      if (visited[node]) return false;

      visited[node] = true;

      return dfs(leftChild[node]) && dfs(rightChild[node]);
    }

    if (!dfs(root)) return false;

    // Step 4: check all nodes visited
    for (bool v in visited) {
      if (!v) return false;
    }

    return true;
  }
}