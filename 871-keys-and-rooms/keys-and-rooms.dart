class Solution {
  bool canVisitAllRooms(List<List<int>> rooms) {
    int n = rooms.length;
    List<bool> visited = List.filled(n, false);

    void dfs(int room) {
      visited[room] = true;

      for (int key in rooms[room]) {
        if (!visited[key]) {
          dfs(key);
        }
      }
    }

    dfs(0);

    for (bool v in visited) {
      if (!v) return false;
    }

    return true;
  }
}