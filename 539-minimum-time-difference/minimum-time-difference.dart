class Solution {
  int findMinDifference(List<String> timePoints) {
    List<int> minutes = [];

    for (String t in timePoints) {
      int h = int.parse(t.split(':')[0]);
      int m = int.parse(t.split(':')[1]);
      minutes.add(h * 60 + m);
    }

    minutes.sort();

    int result = 1440;

    for (int i = 1; i < minutes.length; i++) {
      result = result < (minutes[i] - minutes[i - 1])
          ? result
          : (minutes[i] - minutes[i - 1]);
    }

    // circular case
    int wrapDiff = 1440 - minutes.last + minutes.first;
    result = result < wrapDiff ? result : wrapDiff;

    return result;
  }
}