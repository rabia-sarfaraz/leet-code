class Solution {
  List<bool> canEat(
      List<int> candiesCount, List<List<int>> queries) {
    
    int n = candiesCount.length;

    List<int> prefix = List.filled(n + 1, 0);

    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + candiesCount[i];
    }

    List<bool> ans = [];

    for (var q in queries) {
      int type = q[0];
      int day = q[1];
      int cap = q[2];

      int minCandies = prefix[type] + 1;
      int maxCandies = prefix[type + 1];

      int minEaten = day + 1;
      int maxEaten = (day + 1) * cap;

      ans.add(
        minEaten <= maxCandies &&
        maxEaten >= minCandies
      );
    }

    return ans;
  }
}