class Solution {
  List<double> sampleStats(List<int> count) {
    int total = 0;
    double sum = 0;

    int minimum = -1;
    int maximum = -1;
    int mode = 0;
    int modeCount = 0;

    for (int i = 0; i < 256; i++) {
      if (count[i] > 0) {
        if (minimum == -1) minimum = i;
        maximum = i;

        total += count[i];
        sum += i * count[i];

        if (count[i] > modeCount) {
          modeCount = count[i];
          mode = i;
        }
      }
    }

    double mean = sum / total;

    // median
    int mid1 = (total + 1) ~/ 2;
    int mid2 = (total + 2) ~/ 2;

    int prefix = 0;
    double median1 = 0, median2 = 0;

    for (int i = 0; i < 256; i++) {
      prefix += count[i];

      if (prefix >= mid1 && median1 == 0) {
        median1 = i.toDouble();
      }
      if (prefix >= mid2) {
        median2 = i.toDouble();
        break;
      }
    }

    double median = (median1 + median2) / 2;

    return [
      minimum.toDouble(),
      maximum.toDouble(),
      mean,
      median,
      mode.toDouble()
    ];
  }
}