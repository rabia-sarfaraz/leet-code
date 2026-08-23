class Solution {
  int maxScore(List<int> nums) {
    int n = nums.length;
    int size = 1 << n;

    List<int> dp = List.filled(size, 0);

    int gcd(int a, int b) {
      while (b != 0) {
        int temp = a % b;
        a = b;
        b = temp;
      }
      return a;
    }

    for (int mask = 0; mask < size; mask++) {
      int used = 0;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) {
          used++;
        }
      }

      // Each operation uses 2 numbers
      if (used % 2 != 0) continue;

      int operation = used ~/ 2 + 1;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) continue;

        for (int j = i + 1; j < n; j++) {
          if ((mask & (1 << j)) != 0) continue;

          int newMask = mask | (1 << i) | (1 << j);

          int score =
              dp[mask] + operation * gcd(nums[i], nums[j]);

          if (score > dp[newMask]) {
            dp[newMask] = score;
          }
        }
      }
    }

    return dp[size - 1];
  }
}