class Solution {
  int closestCost(
      List<int> baseCosts,
      List<int> toppingCosts,
      int target) {

    int best = baseCosts[0];

    void update(int cost) {
      if ((cost - target).abs() < (best - target).abs() ||
          ((cost - target).abs() == (best - target).abs() &&
              cost < best)) {
        best = cost;
      }
    }

    void dfs(int index, int cost) {
      update(cost);

      if (index == toppingCosts.length) {
        return;
      }

      // Topping 0 times
      dfs(index + 1, cost);

      // Topping 1 time
      dfs(index + 1, cost + toppingCosts[index]);

      // Topping 2 times
      dfs(index + 1, cost + 2 * toppingCosts[index]);
    }

    for (int base in baseCosts) {
      dfs(0, base);
    }

    return best;
  }
}