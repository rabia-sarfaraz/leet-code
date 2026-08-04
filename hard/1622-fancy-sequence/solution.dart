class Fancy {
  static const int MOD = 1000000007;

  List<int> values = [];
  int mul = 1;
  int add = 0;

  Fancy();

  int modPow(int a, int b) {
    int res = 1;
    int x = a;
    while (b > 0) {
      if ((b & 1) == 1) {
        res = (res * x) % MOD;
      }
      x = (x * x) % MOD;
      b >>= 1;
    }
    return res;
  }

  int modInverse(int x) {
    return modPow(x, MOD - 2);
  }

  void append(int val) {
    int inv = modInverse(mul);
    int original = (((val - add) % MOD + MOD) % MOD);
    original = (original * inv) % MOD;
    values.add(original);
  }

  void addAll(int inc) {
    add = (add + inc) % MOD;
  }

  void multAll(int m) {
    mul = (mul * m) % MOD;
    add = (add * m) % MOD;
  }

  int getIndex(int idx) {
    if (idx >= values.length) return -1;
    return (values[idx] * mul + add) % MOD;
  }
}

/**
 * Your Fancy object will be instantiated and called as such:
 * Fancy obj = Fancy();
 * obj.append(val);
 * obj.addAll(inc);
 * obj.multAll(m);
 * int param4 = obj.getIndex(idx);
 */