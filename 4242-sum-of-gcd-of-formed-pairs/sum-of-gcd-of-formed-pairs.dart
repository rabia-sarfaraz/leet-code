class Solution {
  int gcdSum(List<int> nums) {
    int n = nums.length;

    List<int> prefix = [];
    int mx = 0;

    for (int x in nums) {
      if (x > mx) mx = x;
      prefix.add(_gcd(x, mx));
    }

    prefix.sort();

    int ans = 0;
    int i = 0, j = n - 1;

    while (i < j) {
      ans += _gcd(prefix[i], prefix[j]);
      i++;
      j--;
    }

    return ans;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }
}