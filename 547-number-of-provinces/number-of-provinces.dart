class Solution {
  int findCircleNum(List<List<int>> isConnected) {
    int n = isConnected.length;
    List<bool> visited = List.filled(n, false);

    void dfs(int i) {
      for (int j = 0; j < n; j++) {
        if (isConnected[i][j] == 1 && !visited[j]) {
          visited[j] = true;
          dfs(j);
        }
      }
    }

    int count = 0;

    for (int i = 0; i < n; i++) {
      if (!visited[i]) {
        visited[i] = true;
        dfs(i);
        count++;
      }
    }

    return count;
  }
}