class Solution {
  int zigZagArrays(int n, int l, int r) {
    const int MOD = 1000000007;

    int m = r - l + 1; // number of distinct values

    List<int> up = List.filled(m, 0);
    List<int> down = List.filled(m, 0);

    for (int i = 0; i < m; i++) {
      up[i] = m - 1 - i;
      down[i] = i;
    }

    for (int len = 3; len <= n; len++) {
      List<int> newUp = List.filled(m, 0);
      List<int> newDown = List.filled(m, 0);

      int pref = 0;
      for (int i = 0; i < m; i++) {
        newDown[i] = pref;
        pref = (pref + up[i]) % MOD;
      }

      int suff = 0;
      for (int i = m - 1; i >= 0; i--) {
        newUp[i] = suff;
        suff = (suff + down[i]) % MOD;
      }

      up = newUp;
      down = newDown;
    }

    int ans = 0;
    for (int i = 0; i < m; i++) {
      ans = (ans + up[i] + down[i]) % MOD;
    }

    return ans;
  }
}