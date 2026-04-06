class Solution {
  int eraseOverlapIntervals(List<List<int>> intervals) {
    if (intervals.isEmpty) return 0;

    // sort by end time
    intervals.sort((a, b) => a[1].compareTo(b[1]));

    int count = 0;
    int end = intervals[0][1];

    for (int i = 1; i < intervals.length; i++) {
      if (intervals[i][0] < end) {
        // overlap → remove this interval
        count++;
      } else {
        // no overlap → update end
        end = intervals[i][1];
      }
    }

    return count;
  }
}