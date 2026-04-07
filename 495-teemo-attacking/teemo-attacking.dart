class Solution {
  int findPoisonedDuration(List<int> timeSeries, int duration) {
    if (timeSeries.isEmpty) return 0;

    int total = 0;

    for (int i = 0; i < timeSeries.length - 1; i++) {
      int diff = timeSeries[i + 1] - timeSeries[i];

      if (diff >= duration) {
        total += duration;
      } else {
        total += diff;
      }
    }

    total += duration; // last attack always full duration

    return total;
  }
}