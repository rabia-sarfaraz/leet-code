class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    nums.sort();
    List<List<int>> result = [];
    int n = nums.length;

    for (int i = 0; i < n - 3; i++) {
      // Skip duplicates
      if (i > 0 && nums[i] == nums[i - 1]) continue;

      for (int j = i + 1; j < n - 2; j++) {
        // Skip duplicates
        if (j > i + 1 && nums[j] == nums[j - 1]) continue;

        int left = j + 1;
        int right = n - 1;

        while (left < right) {
          int sum = nums[i] + nums[j] + nums[left] + nums[right];

          if (sum == target) {
            result.add([nums[i], nums[j], nums[left], nums[right]]);

            // Skip duplicates
            while (left < right && nums[left] == nums[left + 1]) left++;
            while (left < right && nums[right] == nums[right - 1]) right--;

            left++;
            right--;
          } else if (sum < target) {
            left++;
          } else {
            right--;
          }
        }
      }
    }

    return result;
  }
}