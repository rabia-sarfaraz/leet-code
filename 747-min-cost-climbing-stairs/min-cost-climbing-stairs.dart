class Solution {
  int minCostClimbingStairs(List<int> cost) {
    int n = cost.length;

    int next1 = 0; // dp[i+1]
    int next2 = 0; // dp[i+2]

    for (int i = n - 1; i >= 0; i--) {
      int curr = cost[i] + (next1 < next2 ? next1 : next2);
      next2 = next1;
      next1 = curr;
    }

    return next1 < next2 ? next1 : next2;
  }
}