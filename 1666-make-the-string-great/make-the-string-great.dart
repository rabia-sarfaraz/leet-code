class Solution {
  String makeGood(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (stack.isNotEmpty &&
          (stack.last.codeUnitAt(0) - ch.codeUnitAt(0)).abs() == 32) {
        stack.removeLast();
      } else {
        stack.add(ch);
      }
    }

    return stack.join();
  }
}