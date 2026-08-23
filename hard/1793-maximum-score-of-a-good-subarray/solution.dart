class Solution {
  int maximumScore(List<int> nums, int k) {
    int left = k;
    int right = k;
    int minVal = nums[k];
    int ans = nums[k];

    while (left > 0 || right < nums.length - 1) {
      if (left == 0) {
        right++;
      } else if (right == nums.length - 1) {
        left--;
      } else if (nums[left - 1] >= nums[right + 1]) {
        left--;
      } else {
        right++;
      }

      minVal = minVal < nums[left] ? minVal : nums[left];
      minVal = minVal < nums[right] ? minVal : nums[right];

      int score = minVal * (right - left + 1);

      if (score > ans) {
        ans = score;
      }
    }

    return ans;
  }
}