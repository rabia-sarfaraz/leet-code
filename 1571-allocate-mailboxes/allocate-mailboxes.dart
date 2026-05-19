class Solution {
  late List<int> houses;
  late List<List<int>> cost;
  late List<List<int>> memo;

  int minDistance(List<int> houses, int k) {
    houses.sort();

    this.houses = houses;

    int n = houses.length;

    // cost[i][j] = minimum distance
    // to place 1 mailbox for houses i..j
    cost = List.generate(
      n,
      (_) => List.filled(n, 0),
    );

    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        int mid = (i + j) ~/ 2;

        for (int x = i; x <= j; x++) {
          cost[i][j] +=
              (houses[x] - houses[mid]).abs();
        }
      }
    }

    memo = List.generate(
      n,
      (_) => List.filled(k + 1, -1),
    );

    return dfs(0, k);
  }

  int dfs(int idx, int k) {
    int n = houses.length;

    // all houses covered
    if (idx == n && k == 0) return 0;

    // invalid
    if (idx == n || k == 0) {
      return 1 << 30;
    }

    if (memo[idx][k] != -1) {
      return memo[idx][k];
    }

    int ans = 1 << 30;

    for (int j = idx; j < n; j++) {
      ans = ans < cost[idx][j] +
              dfs(j + 1, k - 1)
          ? ans
          : cost[idx][j] +
              dfs(j + 1, k - 1);
    }

    memo[idx][k] = ans;
    return ans;
  }
}