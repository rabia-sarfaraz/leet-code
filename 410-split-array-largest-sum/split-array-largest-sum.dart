class Solution {
  int splitArray(List<int> nums, int k) {
    int low = nums.reduce((a, b) => a > b ? a : b);
    int high = nums.reduce((a, b) => a + b);

    while (low < high) {
      int mid = (low + high) ~/ 2;

      if (_canSplit(nums, k, mid)) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }

  bool _canSplit(List<int> nums, int k, int maxAllowed) {
    int count = 1;
    int sum = 0;

    for (int num in nums) {
      if (sum + num > maxAllowed) {
        count++;
        sum = num;
        if (count > k) return false;
      } else {
        sum += num;
      }
    }

    return true;
  }
}