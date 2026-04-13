class Solution {
  String removeOuterParentheses(String s) {
    StringBuffer sb = StringBuffer();
    int count = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        if (count > 0) sb.write('(');
        count++;
      } else {
        count--;
        if (count > 0) sb.write(')');
      }
    }

    return sb.toString();
  }
}