class Solution {
  int numOfSubarrays(List<int> arr) {
    const int mod = 1000000007;

    int odd = 0;
    int even = 1; // empty prefix
    int prefix = 0;
    int ans = 0;

    for (int num in arr) {
      prefix += num;

      if (prefix.isOdd) {
        ans = (ans + even) % mod;
        odd++;
      } else {
        ans = (ans + odd) % mod;
        even++;
      }
    }

    return ans;
  }
}