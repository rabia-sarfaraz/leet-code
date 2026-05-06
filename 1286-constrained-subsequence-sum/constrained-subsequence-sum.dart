import 'dart:collection';

class Solution {
  int constrainedSubsetSum(List<int> nums, int k) {
    int n = nums.length;
    List<int> dp = List.filled(n, 0);
    ListQueue<int> dq = ListQueue<int>(); // FIXED

    int result = nums[0];
    dp[0] = nums[0];
    dq.addLast(0);

    for (int i = 1; i < n; i++) {
      // Step 1: remove out of window
      while (dq.isNotEmpty && dq.first < i - k) {
        dq.removeFirst();
      }

      // Step 2: dp calculation
      dp[i] = nums[i] + (dp[dq.first] > 0 ? dp[dq.first] : 0);

      // Step 3: maintain decreasing deque
      while (dq.isNotEmpty && dp[dq.last] <= dp[i]) {
        dq.removeLast();
      }

      dq.addLast(i);

      // Step 4: update result
      if (dp[i] > result) result = dp[i];
    }

    return result;
  }
}