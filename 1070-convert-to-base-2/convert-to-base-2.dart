class Solution {
  String baseNeg2(int n) {
    if (n == 0) return "0";

    StringBuffer sb = StringBuffer();

    while (n != 0) {
      int r = n & 1; // always 0 or 1
      sb.write(r);
      n = (n - r) ~/ -2;
    }

    return sb.toString().split('').reversed.join();
  }
}