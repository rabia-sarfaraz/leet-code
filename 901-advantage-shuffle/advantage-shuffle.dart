import 'dart:collection';

class Solution {
  List<int> advantageCount(List<int> nums1, List<int> nums2) {
    nums1.sort();

    int n = nums2.length;

    List<List<int>> sortedB = [];
    for (int i = 0; i < n; i++) {
      sortedB.add([nums2[i], i]);
    }

    sortedB.sort((a, b) => b[0].compareTo(a[0]));

    List<int> res = List.filled(n, 0);

    int l = 0;
    int r = nums1.length - 1;

    for (var b in sortedB) {
      int val = b[0];
      int idx = b[1];

      if (nums1[r] > val) {
        res[idx] = nums1[r];
        r--;
      } else {
        res[idx] = nums1[l];
        l++;
      }
    }

    return res;
  }
}