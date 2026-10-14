
class Solution {
  String maxSumOfSquares(int num, int sum) {
    if (sum > num * 9) {
      return "";
    }

    StringBuffer result = StringBuffer();

    for (int i = 0; i < num; i++) {
      int digit = sum >= 9 ? 9 : sum;
      result.write(digit);
      sum -= digit;
    }

    return result.toString();
  }
}
