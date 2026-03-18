class Solution {
  int myAtoi(String s) {
    int i = 0;
    int n = s.length;

    // 1️⃣ Skip leading spaces
    while (i < n && s[i] == ' ') {
      i++;
    }

    // 2️⃣ Check sign
    int sign = 1;
    if (i < n && (s[i] == '+' || s[i] == '-')) {
      if (s[i] == '-') sign = -1;
      i++;
    }

    // 3️⃣ Convert digits
    int result = 0;
    while (i < n && s[i].codeUnitAt(0) >= 48 && s[i].codeUnitAt(0) <= 57) {
      int digit = s[i].codeUnitAt(0) - 48;

      // 4️⃣ Handle overflow BEFORE adding
      if (result > (2147483647 - digit) ~/ 10) {
        return sign == 1 ? 2147483647 : -2147483648;
      }

      result = result * 10 + digit;
      i++;
    }

    return result * sign;
  }
}