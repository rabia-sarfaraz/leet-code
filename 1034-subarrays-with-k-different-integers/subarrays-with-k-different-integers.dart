class Solution {

  int atMostK(List<int> nums, int k) {
    if (k == 0) return 0;

    Map<int, int> freq = {};
    int left = 0;
    int res = 0;

    for (int right = 0; right < nums.length; right++) {
      freq[nums[right]] = (freq[nums[right]] ?? 0) + 1;

      while (freq.length > k) {
        freq[nums[left]] = freq[nums[left]]! - 1;
        if (freq[nums[left]] == 0) {
          freq.remove(nums[left]);
        }
        left++;
      }

      res += (right - left + 1);
    }

    return res;
  }

  int subarraysWithKDistinct(List<int> nums, int k) {
    return atMostK(nums, k) - atMostK(nums, k - 1);
  }
}