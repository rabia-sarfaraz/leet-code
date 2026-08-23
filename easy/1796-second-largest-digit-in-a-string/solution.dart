class Solution {
  int secondHighest(String s) {
    int largest = -1;
    int second = -1;

    for (int i = 0; i < s.length; i++) {
      if (s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
        int digit = s.codeUnitAt(i) - 48;

        if (digit > largest) {
          second = largest;
          largest = digit;
        } else if (digit < largest && digit > second) {
          second = digit;
        }
      }
    }

    return second;
  }
}