class Solution {
  double findMedianSortedArrays(
      List<int> nums1, List<int> nums2) {
    List<int> nums = [...nums1, ...nums2];

    nums.sort();

    int n = nums.length;

    if (n % 2 == 1) {
      return nums[n ~/ 2].toDouble();
    } else {
      return (nums[n ~/ 2 - 1] + nums[n ~/ 2]) / 2.0;
    }
  }
}