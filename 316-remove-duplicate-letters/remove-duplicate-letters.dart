
class Solution {
  String removeDuplicateLetters(String s) {
    List<int> count = List.filled(26, 0);
    List<bool> inStack = List.filled(26, false);
    List<String> stack = [];

    // count frequency
    for (int i = 0; i < s.length; i++) {
      count[s.codeUnitAt(i) - 97]++;
    }

    for (int i = 0; i < s.length; i++) {
      int idx = s.codeUnitAt(i) - 97;

      // reduce count (we are visiting this char)
      count[idx]--;

      if (inStack[idx]) continue;

      // maintain lexicographical order
      while (stack.isNotEmpty) {
        String last = stack.last;
        int lastIdx = last.codeUnitAt(0) - 97;

        if (lastIdx > idx && count[lastIdx] > 0) {
          inStack[lastIdx] = false;
          stack.removeLast();
        } else {
          break;
        }
      }

      stack.add(s[i]);
      inStack[idx] = true;
    }

    return stack.join();
  }
}