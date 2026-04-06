class Solution {
  bool canCross(List<int> stones) {
    int n = stones.length;

    Map<int, Set<int>> dp = {};
    Set<int> stoneSet = stones.toSet();

    for (int s in stones) {
      dp[s] = {};
    }

    dp[0]!.add(0);

    for (int stone in stones) {
      for (int jump in dp[stone]!) {
        for (int step = jump - 1; step <= jump + 1; step++) {
          if (step > 0 && stoneSet.contains(stone + step)) {
            dp[stone + step]!.add(step);
          }
        }
      }
    }

    return dp[stones.last]!.isNotEmpty;
  }
}