class Solution {
  bool isRationalEqual(String s, String t) {
    var f1 = convert(s);
    var f2 = convert(t);
    return f1[0] * f2[1] == f2[0] * f1[1];
  }

  List<int> convert(String s) {
    int integer = 0;
    int nonRepeat = 0;
    int repeat = 0;
    int nonLen = 0;
    int repLen = 0;

    if (!s.contains('.')) {
      return [int.parse(s), 1];
    }

    var parts = s.split('.');
    integer = int.parse(parts[0]);
    String frac = parts[1];

    // no repeating
    if (!frac.contains('(')) {
      nonRepeat = frac.isEmpty ? 0 : int.parse(frac);
      nonLen = frac.length;

      int numerator = integer * pow10(nonLen) + nonRepeat;
      int denominator = pow10(nonLen);

      return simplify(numerator, denominator);
    }

    int idx = frac.indexOf('(');
    String nonRepStr = frac.substring(0, idx);
    String repStr = frac.substring(idx + 1, frac.length - 1);

    nonLen = nonRepStr.length;
    repLen = repStr.length;

    // ✅ FIX HERE
    nonRepeat = nonRepStr.isEmpty ? 0 : int.parse(nonRepStr);
    repeat = repStr.isEmpty ? 0 : int.parse(repStr);

    int powNon = pow10(nonLen);
    int powRep = pow10(repLen);

    int numerator = integer * powNon * (powRep - 1) +
        nonRepeat * (powRep - 1) +
        repeat;

    int denominator = powNon * (powRep - 1);

    return simplify(numerator, denominator);
  }

  int pow10(int n) {
    int res = 1;
    for (int i = 0; i < n; i++) res *= 10;
    return res;
  }

  List<int> simplify(int a, int b) {
    int g = gcd(a, b);
    return [a ~/ g, b ~/ g];
  }

  int gcd(int a, int b) {
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}