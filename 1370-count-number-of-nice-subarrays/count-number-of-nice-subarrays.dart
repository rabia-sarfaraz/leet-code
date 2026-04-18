class Solution {
  int numberOfSubarrays(List<int> nums, int k) {
    return _atMost(nums, k) - _atMost(nums, k - 1);
  }

  int _atMost(List<int> nums, int k) {
    int left = 0, count = 0, result = 0;

    for (int right = 0; right < nums.length; right++) {
      if (nums[right] % 2 == 1) {
        k--;
      }

      while (k < 0) {
        if (nums[left] % 2 == 1) {
          k++;
        }
        left++;
      }

      result += right - left + 1;
    }

    return result;
  }
}