class Solution {
  late List<List<List<int>>> memo;

  int removeBoxes(List<int> boxes) {
    int n = boxes.length;

    memo = List.generate(
        n,
        (_) => List.generate(
            n, (_) => List.filled(n + 1, -1)));

    int dfs(int l, int r, int k) {
      if (l > r) return 0;

      if (memo[l][r][k] != -1) return memo[l][r][k];

      int res = (k + 1) * (k + 1) + dfs(l, r - 1, 0);

      for (int i = l; i < r; i++) {
        if (boxes[i] == boxes[r]) {
          res = res > (dfs(l, i, k + 1) + dfs(i + 1, r - 1, 0))
              ? res
              : (dfs(l, i, k + 1) + dfs(i + 1, r - 1, 0));
        }
      }

      memo[l][r][k] = res;
      return res;
    }

    return dfs(0, n - 1, 0);
  }
}