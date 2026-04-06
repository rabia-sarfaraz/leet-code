class Solution {
  String decodeString(String s) {
    List<int> countStack = [];
    List<String> stringStack = [];

    String current = "";
    int k = 0;

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
          ch.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
        k = k * 10 + int.parse(ch);
      } 
      else if (ch == '[') {
        countStack.add(k);
        stringStack.add(current);
        current = "";
        k = 0;
      } 
      else if (ch == ']') {
        int repeat = countStack.removeLast();
        String prev = stringStack.removeLast();

        current = prev + current * repeat;
      } 
      else {
        current += ch;
      }
    }

    return current;
  }
}