class Solution {
  int intersectionSizeTwo(List<List<int>> intervals) {
    // Step 1: Sort
    intervals.sort((a, b) {
      if (a[1] == b[1]) return b[0].compareTo(a[0]);
      return a[1].compareTo(b[1]);
    });

    List<int> res = [];

    for (var interval in intervals) {
      int start = interval[0];
      int end = interval[1];

      // Count how many already in this interval
      int count = 0;
      for (int x in res) {
        if (x >= start && x <= end) count++;
      }

      // Add missing numbers
      for (int x = end; count < 2; x--) {
        if (!res.contains(x)) {
          res.add(x);
          count++;
        }
      }
    }

    return res.length;
  }
}