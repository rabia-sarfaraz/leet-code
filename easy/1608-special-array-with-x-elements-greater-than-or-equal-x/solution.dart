class Solution {
  int specialArray(List<int> nums) {
    nums.sort();

    int n = nums.length;

    for (int x = 0; x <= n; x++) {
      int left = 0, right = n;

      while (left < right) {
        int mid = left + (right - left) ~/ 2;
        if (nums[mid] >= x) {
          right = mid;
        } else {
          left = mid + 1;
        }
      }

      if (n - left == x) {
        return x;
      }
    }

    return -1;
  }
}