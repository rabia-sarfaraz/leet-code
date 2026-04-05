class NumArray {
  late List<int> bit;
  late List<int> nums;
  late int n;

  NumArray(List<int> nums) {
    n = nums.length;
    this.nums = List.from(nums);
    bit = List.filled(n + 1, 0);

    for (int i = 0; i < n; i++) {
      _updateBIT(i + 1, nums[i]);
    }
  }

  void _updateBIT(int i, int delta) {
    while (i <= n) {
      bit[i] += delta;
      i += i & (-i);
    }
  }

  int _query(int i) {
    int sum = 0;
    while (i > 0) {
      sum += bit[i];
      i -= i & (-i);
    }
    return sum;
  }

  void update(int index, int val) {
    int delta = val - nums[index];
    nums[index] = val;
    _updateBIT(index + 1, delta);
  }

  int sumRange(int left, int right) {
    return _query(right + 1) - _query(left);
  }
}