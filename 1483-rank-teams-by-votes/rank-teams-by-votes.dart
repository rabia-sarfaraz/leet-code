class Solution {
  String rankTeams(List<String> votes) {
    int n = votes[0].length;

    Map<String, List<int>> count = {};

    for (String team in votes[0].split('')) {
      count[team] = List.filled(n, 0);
    }

    for (String vote in votes) {
      for (int i = 0; i < n; i++) {
        count[vote[i]]![i]++;
      }
    }

    List<String> teams = count.keys.toList();

    teams.sort((a, b) {
      for (int i = 0; i < n; i++) {
        if (count[a]![i] != count[b]![i]) {
          return count[b]![i] - count[a]![i];
        }
      }
      return a.compareTo(b);
    });

    return teams.join();
  }
}