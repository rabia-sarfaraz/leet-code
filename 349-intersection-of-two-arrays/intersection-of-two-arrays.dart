class Solution {
  List<int> intersection(List<int> nums1, List<int> nums2) {
    Set<int> set1 = nums1.toSet();
    Set<int> result = {};

    for (int num in nums2) {
      if (set1.contains(num)) {
        result.add(num);
      }
    }

    return result.toList();
  }
}