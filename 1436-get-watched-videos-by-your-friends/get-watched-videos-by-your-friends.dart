class Solution {
  List<String> watchedVideosByFriends(
      List<List<String>> watchedVideos,
      List<List<int>> friends,
      int id,
      int level) {

    int n = friends.length;
    List<bool> visited = List.filled(n, false);
    List<int> queue = [id];
    visited[id] = true;

    int currentLevel = 0;

    // BFS to reach required level
    while (currentLevel < level) {
      List<int> next = [];

      for (int node in queue) {
        for (int nei in friends[node]) {
          if (!visited[nei]) {
            visited[nei] = true;
            next.add(nei);
          }
        }
      }

      queue = next;
      currentLevel++;
    }

    // Count videos
    Map<String, int> freq = {};

    for (int person in queue) {
      for (String video in watchedVideos[person]) {
        freq[video] = (freq[video] ?? 0) + 1;
      }
    }

    List<String> res = freq.keys.toList();

    res.sort((a, b) {
      if (freq[a] != freq[b]) {
        return freq[a]!.compareTo(freq[b]!);
      }
      return a.compareTo(b);
    });

    return res;
  }
}