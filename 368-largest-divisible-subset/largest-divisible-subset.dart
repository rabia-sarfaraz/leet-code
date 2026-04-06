class Solution {
  List<int> largestDivisibleSubset(List<int> nums) {
    if (nums.isEmpty) return [];

    nums.sort();
    int n = nums.length;

    List<int> dp = List.filled(n, 1);
    List<int> prev = List.filled(n, -1);

    int maxSize = 1;
    int maxIndex = 0;

    for (int i = 1; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[i] % nums[j] == 0 && dp[j] + 1 > dp[i]) {
          dp[i] = dp[j] + 1;
          prev[i] = j;
        }
      }

      if (dp[i] > maxSize) {
        maxSize = dp[i];
        maxIndex = i;
      }
    }

    List<int> result = [];
    while (maxIndex != -1) {
      result.add(nums[maxIndex]);
      maxIndex = prev[maxIndex];
    }

    return result.reversed.toList();
  }
}