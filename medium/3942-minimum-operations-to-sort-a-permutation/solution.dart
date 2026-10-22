class Solution {
  int minOperations(List<int> nums) {
    int n = nums.length;
    int zero = nums.indexOf(0);

    bool check(int step) {
      for (int i = 1; i < n; i++) {
        int prev = (zero + (i - 1) * step + n) % n;
        int curr = (zero + i * step + n) % n;

        if (nums[prev] > nums[curr]) {
          return false;
        }
      }
      return true;
    }

    int ans = 1000000000;

    if (check(1)) {
      ans = [ans, zero].reduce((a, b) => a < b ? a : b);
      int cost = n - zero + 2;
      if (cost < ans) ans = cost;
    }

    if (check(-1)) {
      int cost1 = zero + 2;
      if (cost1 < ans) ans = cost1;

      int cost2 = n - zero;
      if (cost2 < ans) ans = cost2;
    }

    return ans == 1000000000 ? -1 : ans;
  }
}