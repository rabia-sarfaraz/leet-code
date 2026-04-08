class Solution {
  bool judgePoint24(List<int> cards) {
    List<double> nums = cards.map((e) => e.toDouble()).toList();
    return _dfs(nums);
  }

  bool _dfs(List<double> nums) {
    if (nums.length == 1) {
      return (nums[0] - 24).abs() < 1e-6;
    }

    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums.length; j++) {
        if (i == j) continue;

        List<double> next = [];

        for (int k = 0; k < nums.length; k++) {
          if (k != i && k != j) {
            next.add(nums[k]);
          }
        }

        for (double val in _compute(nums[i], nums[j])) {
          next.add(val);
          if (_dfs(next)) return true;
          next.removeLast();
        }
      }
    }

    return false;
  }

  List<double> _compute(double a, double b) {
    return [
      a + b,
      a - b,
      b - a,
      a * b,
      if (b != 0) a / b,
      if (a != 0) b / a,
    ];
  }
}