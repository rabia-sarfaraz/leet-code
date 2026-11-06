
class Solution {
  List<int> countServers(
      int n, List<List<int>> logs, int x, List<int> queries) {

    logs.sort((a, b) => a[1].compareTo(b[1]));

    List<int> sortedQueries = List.generate(
      queries.length,
      (i) => i,
    );

    sortedQueries.sort(
      (a, b) => queries[a].compareTo(queries[b]),
    );

    List<int> freq = List.filled(n + 1, 0);
    List<int> ans = List.filled(queries.length, 0);

    int left = 0;
    int right = 0;
    int activeServers = 0;

    for (int idx in sortedQueries) {
      int q = queries[idx];

      // Include logs within the query's time window
      while (right < logs.length && logs[right][1] <= q) {
        int server = logs[right][0];

        if (freq[server] == 0) {
          activeServers++;
        }

        freq[server]++;
        right++;
      }

      // Remove logs older than q - x
      while (left < right && logs[left][1] < q - x) {
        int server = logs[left][0];

        freq[server]--;

        if (freq[server] == 0) {
          activeServers--;
        }

        left++;
      }

      ans[idx] = n - activeServers;
    }

    return ans;
  }
}
