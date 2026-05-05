class Solution {
  String reformat(String s) {
    List<String> letters = [];
    List<String> digits = [];

    // Step 1: separate
    for (int i = 0; i < s.length; i++) {
      if (isDigit(s[i])) {
        digits.add(s[i]);
      } else {
        letters.add(s[i]);
      }
    }

    // Step 2: check possible or not
    if ((letters.length - digits.length).abs() > 1) {
      return "";
    }

    // Step 3: build result
    StringBuffer result = StringBuffer();

    bool letterTurn = letters.length >= digits.length;

    int i = 0, j = 0;

    while (i < letters.length || j < digits.length) {
      if (letterTurn) {
        result.write(letters[i++]);
      } else {
        result.write(digits[j++]);
      }
      letterTurn = !letterTurn;
    }

    return result.toString();
  }

  bool isDigit(String ch) {
    return ch.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
           ch.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }
}