class Solution {
  int countPairs(List<int> deliciousness) {
    const int MOD = 1000000007;

    Map<int, int> freq = {};
    int ans = 0;

    for (int x in deliciousness) {
      // Possible powers of 2
      for (int power = 1; power <= 1 << 21; power <<= 1) {
        int needed = power - x;

        if (freq.containsKey(needed)) {
          ans = (ans + freq[needed]!) % MOD;
        }
      }

      freq[x] = (freq[x] ?? 0) + 1;
    }

    return ans;
  }
}