class Solution {
  List<int> maxNumber(List<int> nums1, List<int> nums2, int k) {
    List<int> best = [];

    for (int i = 0; i <= k; i++) {
      if (i > nums1.length || k - i > nums2.length) continue;

      List<int> part1 = getMaxSubsequence(nums1, i);
      List<int> part2 = getMaxSubsequence(nums2, k - i);

      List<int> merged = merge(part1, part2);

      if (compare(merged, best)) {
        best = merged;
      }
    }

    return best;
  }

  // pick max subsequence of size k
  List<int> getMaxSubsequence(List<int> nums, int k) {
    List<int> stack = [];
    int drop = nums.length - k;

    for (int num in nums) {
      while (stack.isNotEmpty &&
          drop > 0 &&
          stack.last < num) {
        stack.removeLast();
        drop--;
      }
      stack.add(num);
    }

    return stack.sublist(0, k);
  }

  // merge two arrays greedily
  List<int> merge(List<int> a, List<int> b) {
    List<int> result = [];
    int i = 0, j = 0;

    while (i < a.length || j < b.length) {
      if (greater(a, i, b, j)) {
        result.add(i < a.length ? a[i++] : b[j++]);
      } else {
        result.add(j < b.length ? b[j++] : a[i++]);
      }
    }

    return result;
  }

  // compare remaining suffix
  bool greater(List<int> a, int i, List<int> b, int j) {
    while (i < a.length && j < b.length && a[i] == b[j]) {
      i++;
      j++;
    }
    if (j == b.length) return true;
    if (i < a.length && a[i] > b[j]) return true;
    return false;
  }

  // compare full arrays
  bool compare(List<int> a, List<int> b) {
    if (b.isEmpty) return true;
    for (int i = 0; i < a.length; i++) {
      if (a[i] > b[i]) return true;
      if (a[i] < b[i]) return false;
    }
    return false;
  }
}