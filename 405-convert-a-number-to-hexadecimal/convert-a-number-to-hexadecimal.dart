class Solution {
  String toHex(int num) {
    if (num == 0) return "0";

    const hex = "0123456789abcdef";
    int n = num & 0xFFFFFFFF;

    String result = "";

    while (n > 0) {
      int digit = n & 15; // same as n % 16
      result = hex[digit] + result;
      n >>= 4;
    }

    return result;
  }
}