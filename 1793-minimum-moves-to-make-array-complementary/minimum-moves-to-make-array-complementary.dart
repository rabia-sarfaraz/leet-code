class Solution {
  int minMoves(List<int> nums, int limit) {
    int n = nums.length;

    List<int> diff = List.filled(2 * limit + 2, 0);

    for (int i = 0; i < n ~/ 2; i++) {
      int a = nums[i];
      int b = nums[n - 1 - i];

      int low = 1 + (a < b ? a : b);
      int high = limit + (a > b ? a : b);
      int sum = a + b;

      // Default: 2 moves
      diff[2] += 2;

      // Range needing 1 move
      diff[low] -= 1;
      diff[high + 1] += 1;

      // Exact sum needing 0 move
      diff[sum] -= 1;
      diff[sum + 1] += 1;
    }

    int ans = 1 << 30;
    int current = 0;

    for (int s = 2; s <= 2 * limit; s++) {
      current += diff[s];
      ans = ans < current ? ans : current;
    }

    return ans;
  }
}