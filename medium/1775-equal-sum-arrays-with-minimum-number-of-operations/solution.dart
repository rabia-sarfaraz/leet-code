class Solution {
  int minOperations(List<int> nums1, List<int> nums2) {
    int sum1 = nums1.reduce((a, b) => a + b);
    int sum2 = nums2.reduce((a, b) => a + b);

    // Impossible case
    if (nums1.length * 6 < nums2.length ||
        nums2.length * 6 < nums1.length) {
      return -1;
    }

    if (sum1 == sum2) return 0;

    List<int> changes = [];

    if (sum1 > sum2) {
      // nums1 ko decrease OR nums2 ko increase
      for (int x in nums1) {
        changes.add(x - 1);
      }

      for (int x in nums2) {
        changes.add(6 - x);
      }
    } else {
      // nums1 ko increase OR nums2 ko decrease
      for (int x in nums1) {
        changes.add(6 - x);
      }

      for (int x in nums2) {
        changes.add(x - 1);
      }
    }

    changes.sort((a, b) => b.compareTo(a));

    int diff = (sum1 - sum2).abs();
    int operations = 0;

    for (int change in changes) {
      diff -= change;
      operations++;

      if (diff <= 0) {
        return operations;
      }
    }

    return -1;
  }
}