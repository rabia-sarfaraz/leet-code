
class Solution {
  String _build(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '#') {
        if (stack.isNotEmpty) {
          stack.removeLast();
        }
      } else {
        stack.add(s[i]);
      }
    }

    return stack.join();
  }

  bool backspaceCompare(String s, String t) {
    return _build(s) == _build(t);
  }
}