
class Solution {
  int minimumSumSubarray(List<int> nums, int l, int r) {
    int n = nums.length;
    int ans = 1 << 60;

    for (int i = 0; i < n; i++) {
      int sum = 0;

      for (int j = i; j < n && j < i + r; j++) {
        sum += nums[j];

        int len = j - i + 1;

        if (len >= l && sum > 0 && sum < ans) {
          ans = sum;
        }
      }
    }

    return ans == (1 << 60) ? -1 : ans;
  }
}
