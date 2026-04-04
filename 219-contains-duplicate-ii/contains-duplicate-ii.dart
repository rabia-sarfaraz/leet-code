class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    Set<int> window = {};

    int left = 0;

    for (int right = 0; right < nums.length; right++) {
      if (window.contains(nums[right])) {
        return true;
      }

      window.add(nums[right]);

      if (right - left >= k) {
        window.remove(nums[left]);
        left++;
      }
    }

    return false;
  }
}