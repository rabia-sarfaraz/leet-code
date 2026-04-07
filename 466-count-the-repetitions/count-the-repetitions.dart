class Solution {
  int getMaxRepetitions(String s1, int n1, String s2, int n2) {
    if (n1 == 0) return 0;

    int s1cnt = 0; // how many s1 used
    int s2cnt = 0; // how many s2 found
    int index = 0; // position in s2

    Map<int, List<int>> recall = {};

    while (s1cnt < n1) {
      s1cnt++;

      for (int i = 0; i < s1.length; i++) {
        if (s1[i] == s2[index]) {
          index++;
          if (index == s2.length) {
            index = 0;
            s2cnt++;
          }
        }
      }

      // cycle detection
      if (recall.containsKey(index)) {
        var prev = recall[index]!;
        int s1cntPrev = prev[0];
        int s2cntPrev = prev[1];

        int cycleS1 = s1cnt - s1cntPrev;
        int cycleS2 = s2cnt - s2cntPrev;

        int remaining = n1 - s1cnt;

        int cycles = remaining ~/ cycleS1;

        s1cnt += cycles * cycleS1;
        s2cnt += cycles * cycleS2;
      } else {
        recall[index] = [s1cnt, s2cnt];
      }
    }

    return s2cnt ~/ n2;
  }
}