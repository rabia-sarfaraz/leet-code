class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    if (intervals.isEmpty) return [];

    // Step 1: sort by start time
    intervals.sort((a, b) => a[0].compareTo(b[0]));

    List<List<int>> result = [];
    result.add(intervals[0]);

    for (int i = 1; i < intervals.length; i++) {
      List<int> last = result.last;
      List<int> current = intervals[i];

      if (current[0] <= last[1]) {
        // overlap → merge
        last[1] = (current[1] > last[1]) ? current[1] : last[1];
      } else {
        // no overlap
        result.add(current);
      }
    }

    return result;
  }
}