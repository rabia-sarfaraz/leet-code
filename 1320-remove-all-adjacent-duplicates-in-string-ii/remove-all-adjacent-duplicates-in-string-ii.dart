class Solution {
  String removeDuplicates(String s, int k) {
    List<List<dynamic>> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (stack.isNotEmpty && stack.last[0] == ch) {
        stack.last[1] += 1;
      } else {
        stack.add([ch, 1]);
      }

      if (stack.last[1] == k) {
        stack.removeLast();
      }
    }

    StringBuffer result = StringBuffer();

    for (var item in stack) {
      result.write(item[0] * item[1]);
    }

    return result.toString();
  }
}