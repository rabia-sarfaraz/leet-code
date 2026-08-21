class Solution {
  int totalMoney(int n) {
    int weeks = n ~/ 7;
    int days = n % 7;

    // Complete weeks ka total
    int total = weeks * 28 + 7 * weeks * (weeks - 1) ~/ 2;

    // Last incomplete week
    total += days * (weeks + 1) + days * (days - 1) ~/ 2;

    return total;
  }
}