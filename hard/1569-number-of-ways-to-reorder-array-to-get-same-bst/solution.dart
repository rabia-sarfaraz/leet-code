
class Solution {
  static const int mod = 1000000007;
  late List<List<int>> comb;

  int numOfWays(List<int> nums) {
    int n = nums.length;

    comb = List.generate(
      n + 1,
      (_) => List.filled(n + 1, 0),
    );

    for (int i = 0; i <= n; i++) {
      comb[i][0] = 1;
      comb[i][i] = 1;

      for (int j = 1; j < i; j++) {
        comb[i][j] =
            (comb[i - 1][j - 1] + comb[i - 1][j]) % mod;
      }
    }

    return (ways(nums) - 1 + mod) % mod;
  }

  int ways(List<int> nums) {
    int n = nums.length;

    if (n <= 2) return 1;

    int root = nums[0];
    List<int> left = [];
    List<int> right = [];

    for (int i = 1; i < n; i++) {
      if (nums[i] < root) {
        left.add(nums[i]);
      } else {
        right.add(nums[i]);
      }
    }

    int result = comb[n - 1][left.length];

    result = (result * ways(left)) % mod;
    result = (result * ways(right)) % mod;

    return result;
  }
}
