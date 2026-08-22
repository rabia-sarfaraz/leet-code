class Solution {
  int countHomogenous(String s) {
    const int MOD = 1000000007;

    int ans = 0;
    int count = 0;
    String prev = '';

    for (int i = 0; i < s.length; i++) {
      if (s[i] == prev) {
        count++;
      } else {
        count = 1;
        prev = s[i];
      }

      ans = (ans + count) % MOD;
    }

    return ans;
  }
}