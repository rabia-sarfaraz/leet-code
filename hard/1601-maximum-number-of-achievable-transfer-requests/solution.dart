class Solution {
  int maximumRequests(int n, List<List<int>> requests) {
    int m = requests.length;
    int ans = 0;

    for (int mask = 0; mask < (1 << m); mask++) {
      List<int> balance = List.filled(n, 0);
      int cnt = 0;

      for (int i = 0; i < m; i++) {
        if ((mask & (1 << i)) != 0) {
          cnt++;
          balance[requests[i][0]]--;
          balance[requests[i][1]]++;
        }
      }

      bool ok = true;
      for (int x in balance) {
        if (x != 0) {
          ok = false;
          break;
        }
      }

      if (ok && cnt > ans) ans = cnt;
    }

    return ans;
  }
}