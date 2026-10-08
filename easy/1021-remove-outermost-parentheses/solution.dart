class Solution {
  String removeOuterParentheses(String s) {
    String result = "";
    int depth = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        if (depth > 0) {
          result += '(';
        }
        depth++;
      } else {
        depth--;
        if (depth > 0) {
          result += ')';
        }
      }
    }

    return result;
  }
}