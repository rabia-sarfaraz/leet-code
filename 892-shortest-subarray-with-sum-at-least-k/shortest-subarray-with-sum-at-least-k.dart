class Solution {
  int shortestSubarray(List<int> nums, int k) {
    int n = nums.length;

    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + nums[i];
    }

    List<int> dq = [];
    int ans = n + 1;

    for (int i = 0; i <= n; i++) {

      // check valid subarray
      while (dq.isNotEmpty && prefix[i] - prefix[dq.first] >= k) {
        ans = ans < (i - dq.first) ? ans : (i - dq.first);
        dq.removeAt(0);
      }

      // maintain increasing prefix
      while (dq.isNotEmpty && prefix[i] <= prefix[dq.last]) {
        dq.removeLast();
      }

      dq.add(i);
    }

    return ans == n + 1 ? -1 : ans;
  }
}