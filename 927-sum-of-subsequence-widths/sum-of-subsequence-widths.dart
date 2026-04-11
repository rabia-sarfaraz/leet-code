class Solution {
  int sumSubseqWidths(List<int> nums) {
    nums.sort();
    int n = nums.length;
    int mod = 1000000007;

    List<int> pow = List.filled(n, 1);

    for (int i = 1; i < n; i++) {
      pow[i] = (pow[i - 1] * 2) % mod;
    }

    int res = 0;

    for (int i = 0; i < n; i++) {
      int maxContrib = pow[i];
      int minContrib = pow[n - i - 1];

      int val = (nums[i] * ((maxContrib - minContrib) % mod)) % mod;

      res = (res + val) % mod;
    }

    return res;
  }
}