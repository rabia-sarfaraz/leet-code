class Solution {
  String convertToBase7(int num) {
    if (num == 0) return "0";

    bool isNegative = num < 0;
    num = num.abs();

    String result = "";

    while (num > 0) {
      result += (num % 7).toString();
      num ~/= 7;
    }

    // reverse string
    result = result.split('').reversed.join();

    return isNegative ? "-$result" : result;
  }
}