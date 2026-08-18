class Solution {
  int maximumWealth(List<List<int>> accounts) {
    int maxWealth = 0;

    for (var customer in accounts) {
      int wealth = 0;

      for (var money in customer) {
        wealth += money;
      }

      if (wealth > maxWealth) {
        maxWealth = wealth;
      }
    }

    return maxWealth;
  }
}