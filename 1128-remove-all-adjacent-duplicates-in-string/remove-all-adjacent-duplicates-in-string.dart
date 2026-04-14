class Solution {
  String removeDuplicates(String s) {
    List<String> stack = [];

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (stack.isNotEmpty && stack.last == ch) {
        stack.removeLast();
      } else {
        stack.add(ch);
      }
    }

    return stack.join('');
  }
}