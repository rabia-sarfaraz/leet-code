class Solution {
  String fractionToDecimal(int numerator, int denominator) {
    if (numerator == 0) return "0";

    StringBuffer sb = StringBuffer();

    // sign handle
    if ((numerator < 0) ^ (denominator < 0)) {
      sb.write("-");
    }

    int n = numerator.abs();
    int d = denominator.abs();

    // integer part
    sb.write(n ~/ d);
    int rem = n % d;

    if (rem == 0) return sb.toString();

    sb.write(".");

    Map<int, int> map = {}; // remainder -> index

    while (rem != 0) {
      if (map.containsKey(rem)) {
        int idx = map[rem]!;
        String res = sb.toString();
        return res.substring(0, idx) +
            "(" +
            res.substring(idx) +
            ")";
      }

      map[rem] = sb.length;
      rem *= 10;
      sb.write(rem ~/ d);
      rem %= d;
    }

    return sb.toString();
  }
}