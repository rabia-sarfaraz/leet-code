class Solution {
  bool predictTheWinner(List<int> nums) {
    int n = nums.length;
    List<List<int?>> memo = List.generate(
      n,
      (_) => List<int?>.filled(n, null),
    );

    int dfs(int l, int r) {
      if (l == r) return nums[l];

      if (memo[l][r] != null) return memo[l][r]!;

      int takeLeft = nums[l] - dfs(l + 1, r);
      int takeRight = nums[r] - dfs(l, r - 1);

      return memo[l][r] = takeLeft > takeRight ? takeLeft : takeRight;
    }

    return dfs(0, n - 1) >= 0;
  }
}