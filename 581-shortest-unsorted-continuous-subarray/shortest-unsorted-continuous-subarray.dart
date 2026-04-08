class Solution {
  int findUnsortedSubarray(List<int> nums) {
    int n = nums.length;

    List<int> sorted = List.from(nums);
    sorted.sort();

    int left = 0;
    while (left < n && nums[left] == sorted[left]) {
      left++;
    }

    if (left == n) return 0;

    int right = n - 1;
    while (right >= 0 && nums[right] == sorted[right]) {
      right--;
    }

    return right - left + 1;
  }
}