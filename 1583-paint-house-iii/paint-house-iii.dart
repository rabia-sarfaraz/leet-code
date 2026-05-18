class Solution {
  late List<int> houses;
  late List<List<int>> cost;
  late int m, n, target;

  Map<String, int> memo = {};

  int minCost(
      List<int> houses,
      List<List<int>> cost,
      int m,
      int n,
      int target) {
    
    this.houses = houses;
    this.cost = cost;
    this.m = m;
    this.n = n;
    this.target = target;

    int ans = dfs(0, 0, 0);

    return ans == 1000000000 ? -1 : ans;
  }

  int dfs(int idx, int prevColor, int groups) {
    // too many neighborhoods
    if (groups > target) {
      return 1000000000;
    }

    // all houses processed
    if (idx == m) {
      return groups == target ? 0 : 1000000000;
    }

    String key = "$idx,$prevColor,$groups";

    if (memo.containsKey(key)) {
      return memo[key]!;
    }

    int ans = 1000000000;

    // already painted
    if (houses[idx] != 0) {
      int newGroups =
          groups + (houses[idx] != prevColor ? 1 : 0);

      ans = dfs(idx + 1, houses[idx], newGroups);
    } else {
      // try all colors
      for (int color = 1; color <= n; color++) {
        int newGroups =
            groups + (color != prevColor ? 1 : 0);

        ans = ans < cost[idx][color - 1] +
                dfs(idx + 1, color, newGroups)
            ? ans
            : cost[idx][color - 1] +
                dfs(idx + 1, color, newGroups);
      }
    }

    memo[key] = ans;
    return ans;
  }
}