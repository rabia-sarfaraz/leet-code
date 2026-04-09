class Solution {
  int minSwap(List<int> nums1, List<int> nums2) {
    int n = nums1.length;

    int keep = 0;      // no swap at i-1
    int swap = 1;      // swap at i-1

    for (int i = 1; i < n; i++) {
      int newKeep = 100000;
      int newSwap = 100000;

      // condition 1: already increasing without swap
      if (nums1[i] > nums1[i - 1] && nums2[i] > nums2[i - 1]) {
        newKeep = keep;
        newSwap = swap + 1;
      }

      // condition 2: swapping helps
      if (nums1[i] > nums2[i - 1] && nums2[i] > nums1[i - 1]) {
        newKeep = newKeep < swap ? newKeep : swap;
        newSwap = newSwap < (keep + 1) ? newSwap : (keep + 1);
      }

      keep = newKeep;
      swap = newSwap;
    }

    return keep < swap ? keep : swap;
  }
}