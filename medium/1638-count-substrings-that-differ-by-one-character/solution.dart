class Solution {
  int countSubstrings(String s, String t) {
    int m = s.length;
    int n = t.length;
    int ans = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        int diff = 0;
        int x = i, y = j;

        while (x < m && y < n) {
          if (s[x] != t[y]) diff++;
          if (diff > 1) break;
          if (diff == 1) ans++;
          x++;
          y++;
        }
      }
    }

    return ans;
  }
}