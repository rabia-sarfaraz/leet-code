class Solution {
  int minAbsoluteSumDiff(List<int> nums1, List<int> nums2) {
    const int MOD = 1000000007;
    int n = nums1.length;

    // nums1 ki sorted copy
    List<int> sorted = List.from(nums1)..sort();

    int total = 0;
    int maxSaving = 0;

    for (int i = 0; i < n; i++) {
      int diff = (nums1[i] - nums2[i]).abs();
      total = (total + diff) % MOD;

      // Binary search: nums2[i] ke closest value ko find karo
      int left = 0;
      int right = n - 1;

      while (left <= right) {
        int mid = (left + right) ~/ 2;

        if (sorted[mid] < nums2[i]) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }

      // left is the first value >= nums2[i]
      if (left < n) {
        int newDiff = (sorted[left] - nums2[i]).abs();
        maxSaving = maxSaving > (diff - newDiff)
            ? maxSaving
            : (diff - newDiff);
      }

      // Check previous value as well
      if (left > 0) {
        int newDiff = (sorted[left - 1] - nums2[i]).abs();
        maxSaving = maxSaving > (diff - newDiff)
            ? maxSaving
            : (diff - newDiff);
      }
    }

    return (total - maxSaving + MOD) % MOD;
  }
}