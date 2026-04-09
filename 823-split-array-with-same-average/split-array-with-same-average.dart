class Solution {
  bool splitArraySameAverage(List<int> nums) {
    int n = nums.length;
    int total = nums.reduce((a, b) => a + b);

    nums.sort();

    // dp[k] = set of possible sums using k elements
    List<Set<int>> dp =
        List.generate(n + 1, (_) => <int>{});

    dp[0].add(0);

    for (int num in nums) {
      for (int k = n - 1; k >= 0; k--) {
        for (int s in dp[k]) {
          dp[k + 1].add(s + num);
        }
      }
    }

    for (int k = 1; k <= n ~/ 2; k++) {
      if ((total * k) % n != 0) continue;

      int target = (total * k) ~/ n;

      if (dp[k].contains(target)) {
        return true;
      }
    }

    return false;
  }
}