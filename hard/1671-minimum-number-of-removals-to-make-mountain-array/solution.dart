class Solution {
  int minimumMountainRemovals(List<int> nums) {
    int n = nums.length;

    List<int> left = List.filled(n, 1);
    List<int> right = List.filled(n, 1);

    // Increasing subsequence ending at i
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[j] < nums[i]) {
          left[i] = max(left[i], left[j] + 1);
        }
      }
    }

    // Decreasing subsequence starting at i
    for (int i = n - 1; i >= 0; i--) {
      for (int j = n - 1; j > i; j--) {
        if (nums[j] < nums[i]) {
          right[i] = max(right[i], right[j] + 1);
        }
      }
    }

    int longestMountain = 0;

    for (int i = 1; i < n - 1; i++) {
      // Peak must have both increasing and decreasing sides
      if (left[i] > 1 && right[i] > 1) {
        longestMountain =
            max(longestMountain, left[i] + right[i] - 1);
      }
    }

    return n - longestMountain;
  }

  int max(int a, int b) {
    return a > b ? a : b;
  }
}