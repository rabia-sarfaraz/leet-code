class Solution {
  int maxScoreSightseeingPair(List<int> values) {
    int bestI = values[0] + 0;
    int result = 0;

    for (int j = 1; j < values.length; j++) {
      result = result > (bestI + values[j] - j)
          ? result
          : (bestI + values[j] - j);

      bestI = bestI > (values[j] + j) ? bestI : (values[j] + j);
    }

    return result;
  }
}