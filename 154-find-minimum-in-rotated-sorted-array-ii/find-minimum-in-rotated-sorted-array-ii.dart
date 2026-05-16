class Solution {
  int findMin(List<int> nums) {
    int left = 0;
    int right = nums.length - 1;

    while (left < right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] > nums[right]) {
        // Minimum is in right half
        left = mid + 1;
      } 
      else if (nums[mid] < nums[right]) {
        // Minimum is at mid or left half
        right = mid;
      } 
      else {
        // Cannot determine side because of duplicates
        right--;
      }
    }

    return nums[left];
  }
}