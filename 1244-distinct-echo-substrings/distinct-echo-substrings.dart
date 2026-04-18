class Solution {
  int distinctEchoSubstrings(String text) {
    int n = text.length;
    const int mod = 1000000007;
    const int base = 31;

    List<int> power = List.filled(n + 1, 1);
    for (int i = 1; i <= n; i++) {
      power[i] = (power[i - 1] * base) % mod;
    }

    List<int> prefix = List.filled(n + 1, 0);

    for (int i = 0; i < n; i++) {
      prefix[i + 1] =
          (prefix[i] * base + (text.codeUnitAt(i) - 96)) % mod;
    }

    int getHash(int l, int r) {
      return (prefix[r] -
              (prefix[l] * power[r - l]) % mod +
              mod) %
          mod;
    }

    Set<int> seen = {};

    for (int len = 1; len * 2 <= n; len++) {
      for (int i = 0; i + 2 * len <= n; i++) {
        int h1 = getHash(i, i + len);
        int h2 = getHash(i + len, i + 2 * len);

        if (h1 == h2) {
          seen.add(h1);
        }
      }
    }

    return seen.length;
  }
}