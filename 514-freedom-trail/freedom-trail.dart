class Solution {
  int findRotateSteps(String ring, String key) {
    int n = ring.length;
    int m = key.length;

    Map<String, int> memo = {};

    int dfs(int rIdx, int kIdx) {
      if (kIdx == m) return 0;

      String state = "$rIdx,$kIdx";
      if (memo.containsKey(state)) return memo[state]!;

      int res = 1 << 30;

      for (int i = 0; i < n; i++) {
        if (ring[i] == key[kIdx]) {
          int diff = (rIdx - i).abs();
          int step = diff < n - diff ? diff : n - diff;

          res = res < step + 1 + dfs(i, kIdx + 1)
              ? res
              : step + 1 + dfs(i, kIdx + 1);
        }
      }

      memo[state] = res;
      return res;
    }

    return dfs(0, 0);
  }
}