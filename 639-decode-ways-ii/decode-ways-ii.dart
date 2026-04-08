class Solution {
  int numDecodings(String s) {
    const int mod = 1000000007;
    int n = s.length;

    List<int> dp = List.filled(n + 1, 0);
    dp[0] = 1;

    // first char
    dp[1] = countSingle(s[0]);

    for (int i = 2; i <= n; i++) {
      String one = s[i - 1];
      String two = s.substring(i - 2, i);

      dp[i] = (countSingle(one) * dp[i - 1]) % mod +
              (countDouble(two) * dp[i - 2]) % mod;

      dp[i] %= mod;
    }

    return dp[n];
  }

  int countSingle(String ch) {
    if (ch == '*') return 9;
    if (ch == '0') return 0;
    return 1;
  }

  int countDouble(String s) {
    String a = s[0];
    String b = s[1];

    if (a == '*' && b == '*') {
      return 15; // 11-19 (9) + 21-26 (6)
    }

    if (a == '*') {
      if (b.compareTo('0') >= 0 && b.compareTo('6') <= 0) return 2;
      return 1;
    }

    if (b == '*') {
      if (a == '1') return 9;
      if (a == '2') return 6;
      return 0;
    }

    int val = int.parse(s);
    return (val >= 10 && val <= 26) ? 1 : 0;
  }
}