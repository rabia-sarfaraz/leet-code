class Solution {
  String addStrings(String num1, String num2) {
    int i = num1.length - 1;
    int j = num2.length - 1;

    int carry = 0;
    String result = "";

    while (i >= 0 || j >= 0 || carry != 0) {
      int x = i >= 0 ? num1.codeUnitAt(i) - '0'.codeUnitAt(0) : 0;
      int y = j >= 0 ? num2.codeUnitAt(j) - '0'.codeUnitAt(0) : 0;

      int sum = x + y + carry;
      carry = sum ~/ 10;

      result = (sum % 10).toString() + result;

      i--;
      j--;
    }

    return result;
  }
}