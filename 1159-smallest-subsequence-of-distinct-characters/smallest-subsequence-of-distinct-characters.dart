class Solution {
  String smallestSubsequence(String s) {
    List<int> last = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      last[s.codeUnitAt(i) - 97] = i;
    }

    List<bool> used = List.filled(26, false);
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      int idx = s.codeUnitAt(i) - 97;

      if (used[idx]) continue;

      while (stack.isNotEmpty) {
        String top = stack.last;
        int topIdx = top.codeUnitAt(0) - 97;

        if (top.compareTo(s[i]) > 0 && last[topIdx] > i) {
          used[topIdx] = false;
          stack.removeLast();
        } else {
          break;
        }
      }

      stack.add(s[i]);
      used[idx] = true;
    }

    return stack.join();
  }
}