class Solution {
  int minSteps(String s, String t) {
    List<int> freq = List.filled(26, 0);

    // count s
    for (int i = 0; i < s.length; i++) {
      freq[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    // subtract t
    for (int i = 0; i < t.length; i++) {
      freq[t.codeUnitAt(i) - 'a'.codeUnitAt(0)]--;
    }

    int steps = 0;

    // count extra in t
    for (int x in freq) {
      if (x < 0) steps += -x;
    }

    return steps;
  }
}