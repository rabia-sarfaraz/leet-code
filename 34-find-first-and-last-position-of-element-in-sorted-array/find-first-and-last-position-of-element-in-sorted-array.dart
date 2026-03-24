class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int first = findFirst(nums, target);
    int last = findLast(nums, target);
    return [first, last];
  }

  int findFirst(List<int> nums, int target) {
    int left = 0, right = nums.length - 1;
    int index = -1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] == target) {
        index = mid;
        right = mid - 1; // left side search
      } else if (nums[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return index;
  }

  int findLast(List<int> nums, int target) {
    int left = 0, right = nums.length - 1;
    int index = -1;

    while (left <= right) {
      int mid = left + (right - left) ~/ 2;

      if (nums[mid] == target) {
        index = mid;
        left = mid + 1; // right side search
      } else if (nums[mid] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return index;
  }
}