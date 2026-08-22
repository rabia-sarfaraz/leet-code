class Solution {
  static const int MOD = 1000000007;

  List<int> waysToFillArray(List<List<int>> queries) {
    int maxN = 10000;
    int maxK = 15;

    // factorial
    List<int> fact = List.filled(maxN + maxK + 1, 1);

    for (int i = 1; i < fact.length; i++) {
      fact[i] = (fact[i - 1] * i) % MOD;
    }

    // Modular inverse
    int modPow(int a, int b) {
      int result = 1;

      while (b > 0) {
        if (b % 2 == 1) {
          result = (result * a) % MOD;
        }

        a = (a * a) % MOD;
        b ~/= 2;
      }

      return result;
    }

    int combination(int n, int r) {
      if (r < 0 || r > n) return 0;

      int numerator = fact[n];
      int denominator =
          (fact[r] * fact[n - r]) % MOD;

      return (numerator * modPow(denominator, MOD - 2)) % MOD;
    }

    List<int> answer = [];

    for (var query in queries) {
      int n = query[0];
      int k = query[1];

      int x = k;
      int ways = 1;

      // Prime factorization
      for (int p = 2; p * p <= x; p++) {
        if (x % p == 0) {
          int count = 0;

          while (x % p == 0) {
            x ~/= p;
            count++;
          }

          // stars and bars:
          // C(n + count - 1, count)
          ways = (ways * combination(n + count - 1, count)) % MOD;
        }
      }

      // Remaining prime factor
      if (x > 1) {
        ways = (ways * n) % MOD;
      }

      answer.add(ways);
    }

    return answer;
  }
}