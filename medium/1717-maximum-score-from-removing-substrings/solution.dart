class Solution {
  int maximumGain(String s, int x, int y) {
    int score = 0;

    // Pehle higher-score pair remove karo
    String first = x >= y ? "ab" : "ba";
    String second = x >= y ? "ba" : "ab";

    int firstScore = x >= y ? x : y;
    int secondScore = x >= y ? y : x;

    List<String> stack = [];

    // First pair remove
    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (stack.isNotEmpty &&
          stack.last == first[0] &&
          c == first[1]) {
        stack.removeLast();
        score += firstScore;
      } else {
        stack.add(c);
      }
    }

    // Remaining string mein second pair remove
    List<String> stack2 = [];

    for (String c in stack) {
      if (stack2.isNotEmpty &&
          stack2.last == second[0] &&
          c == second[1]) {
        stack2.removeLast();
        score += secondScore;
      } else {
        stack2.add(c);
      }
    }

    return score;
  }
}