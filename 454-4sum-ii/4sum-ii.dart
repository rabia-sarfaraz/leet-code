class Solution {
  int fourSumCount(List<int> nums1, List<int> nums2, List<int> nums3, List<int> nums4) {
    Map<int, int> map = {};
    int n = nums1.length;
    int count = 0;

    // Step 1: store sums of first two arrays
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        int sum = nums1[i] + nums2[j];
        map[sum] = (map[sum] ?? 0) + 1;
      }
    }

    // Step 2: check complements from last two arrays
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        int target = -(nums3[i] + nums4[j]);
        if (map.containsKey(target)) {
          count += map[target]!;
        }
      }
    }

    return count;
  }
}