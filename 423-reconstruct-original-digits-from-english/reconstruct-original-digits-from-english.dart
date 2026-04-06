class Solution {
  String originalDigits(String s) {
    List<int> count = List.filled(26, 0);

    for (int i = 0; i < s.length; i++) {
      count[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    List<int> digit = List.filled(10, 0);

    // unique letters
    digit[0] = count['z'.codeUnitAt(0) - 97]; // zero
    digit[2] = count['w'.codeUnitAt(0) - 97]; // two
    digit[4] = count['u'.codeUnitAt(0) - 97]; // four
    digit[6] = count['x'.codeUnitAt(0) - 97]; // six
    digit[8] = count['g'.codeUnitAt(0) - 97]; // eight

    // overlapping letters
    digit[3] = count['h'.codeUnitAt(0) - 97] - digit[8]; // three
    digit[5] = count['f'.codeUnitAt(0) - 97] - digit[4]; // five
    digit[7] = count['s'.codeUnitAt(0) - 97] - digit[6]; // seven

    digit[1] = count['o'.codeUnitAt(0) - 97] - digit[0] - digit[2] - digit[4];
    digit[9] = count['i'.codeUnitAt(0) - 97] - digit[5] - digit[6] - digit[8];

    StringBuffer sb = StringBuffer();

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < digit[i]; j++) {
        sb.write(i);
      }
    }

    return sb.toString();
  }
}