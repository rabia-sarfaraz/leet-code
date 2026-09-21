class Solution {
  List<int> resultArray(List<int> nums, int k) {
    List<int> ans = List.filled(k, 0);
    List<int> dp = List.filled(k, 0);

    for (int num in nums) {
      int value = num % k;

      List<int> newDp = List.filled(k, 0);

      // Sirf current element wala subarray
      newDp[value] = 1;

      // Previous subarrays ko current element ke sath extend karo
      for (int r = 0; r < k; r++) {
        int newR = (r * value) % k;
        newDp[newR] += dp[r];
      }

      // Current ending wale saare subarrays answer mein add
      for (int r = 0; r < k; r++) {
        ans[r] += newDp[r];
      }

      dp = newDp;
    }

    return ans;
  }
}