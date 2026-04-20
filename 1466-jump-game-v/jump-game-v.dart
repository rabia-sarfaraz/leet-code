class Solution {
  late List<int> memo;
  late List<int> arr;
  late int n;
  late int d;

  int maxJumps(List<int> arr, int d) {
    this.arr = arr;
    this.d = d;
    n = arr.length;
    memo = List.filled(n, -1);

    int ans = 0;
    for (int i = 0; i < n; i++) {
      ans = ans > dfs(i) ? ans : dfs(i);
    }

    return ans;
  }

  int dfs(int i) {
    if (memo[i] != -1) return memo[i];

    int best = 1;

    // go left
    for (int j = i - 1; j >= i - d && j >= 0; j--) {
      if (arr[j] >= arr[i]) break;
      best = best > (1 + dfs(j)) ? best : (1 + dfs(j));
    }

    // go right
    for (int j = i + 1; j <= i + d && j < n; j++) {
      if (arr[j] >= arr[i]) break;
      best = best > (1 + dfs(j)) ? best : (1 + dfs(j));
    }

    return memo[i] = best;
  }
}