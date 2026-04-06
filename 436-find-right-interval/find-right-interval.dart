class Solution {
  List<int> findRightInterval(List<List<int>> intervals) {
    int n = intervals.length;

    // store (start, index)
    List<List<int>> starts = [];

    for (int i = 0; i < n; i++) {
      starts.add([intervals[i][0], i]);
    }

    starts.sort((a, b) => a[0].compareTo(b[0]));

    List<int> result = List.filled(n, -1);

    for (int i = 0; i < n; i++) {
      int target = intervals[i][1];

      int left = 0, right = n - 1;
      int ans = -1;

      while (left <= right) {
        int mid = (left + right) ~/ 2;

        if (starts[mid][0] >= target) {
          ans = starts[mid][1];
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      }

      result[i] = ans;
    }

    return result;
  }
}