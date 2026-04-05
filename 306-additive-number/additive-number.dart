class Solution {
  bool isAdditiveNumber(String num) {
    int n = num.length;

    for (int i = 1; i <= n ~/ 2; i++) {
      // first number
      if (num[0] == '0' && i > 1) break;

      for (int j = i + 1; j < n; j++) {
        // second number
        if (num[i] == '0' && j - i > 1) break;

        if (isValid(num, 0, i, j)) {
          return true;
        }
      }
    }

    return false;
  }

  bool isValid(String num, int start, int i, int j) {
    BigInt num1 = BigInt.parse(num.substring(start, i));
    BigInt num2 = BigInt.parse(num.substring(i, j));

    while (j < num.length) {
      BigInt sum = num1 + num2;
      String sumStr = sum.toString();

      if (!num.startsWith(sumStr, j)) return false;

      j += sumStr.length;
      num1 = num2;
      num2 = sum;
    }

    return true;
  }
}