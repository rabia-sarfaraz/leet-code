class Solution {
  int flipgame(List<int> fronts, List<int> backs) {
    Set<int> bad = {};

    int n = fronts.length;

    // collect bad numbers (same on both sides)
    for (int i = 0; i < n; i++) {
      if (fronts[i] == backs[i]) {
        bad.add(fronts[i]);
      }
    }

    int result = 100000;

    // check all candidates
    for (int i = 0; i < n; i++) {
      if (!bad.contains(fronts[i])) {
        result = result < fronts[i] ? result : fronts[i];
      }
      if (!bad.contains(backs[i])) {
        result = result < backs[i] ? result : backs[i];
      }
    }

    return result == 100000 ? 0 : result;
  }
}