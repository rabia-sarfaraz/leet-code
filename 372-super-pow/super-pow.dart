class Solution {
  static const int MOD = 1337;

  int superPow(int a, List<int> b) {
    int result = 1;
    a %= MOD;

    for (int digit in b) {
      result = modPow(result, 10) * modPow(a, digit) % MOD;
    }

    return result;
  }

  int modPow(int base, int exp) {
    int result = 1;
    base %= MOD;

    while (exp > 0) {
      if (exp % 2 == 1) {
        result = (result * base) % MOD;
      }
      base = (base * base) % MOD;
      exp ~/= 2;
    }

    return result;
  }
}