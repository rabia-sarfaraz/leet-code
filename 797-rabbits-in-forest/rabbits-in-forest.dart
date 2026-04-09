class Solution {
  int numRabbits(List<int> answers) {
    Map<int, int> freq = {};

    for (int a in answers) {
      freq[a] = (freq[a] ?? 0) + 1;
    }

    int res = 0;

    freq.forEach((x, f) {
      int groupSize = x + 1;
      int groups = (f + groupSize - 1) ~/ groupSize;
      res += groups * groupSize;
    });

    return res;
  }
}