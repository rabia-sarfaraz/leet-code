class Solution {
  int waysToSplit(List<int> nums) {
    const int MOD = 1000000007;
    int n = nums.length;

    List<int> prefix = List.filled(n, 0);
    prefix[0] = nums[0];

    for (int i = 1; i < n; i++) {
      prefix[i] = prefix[i - 1] + nums[i];
    }

    int ans = 0;

    for (int i = 0; i < n - 2; i++) {
      int left = prefix[i];

      // First j where middle sum >= left
      int low = i + 1;
      int high = n - 2;

      while (low <= high) {
        int mid = (low + high) ~/ 2;
        int middle = prefix[mid] - prefix[i];

        if (middle >= left) {
          high = mid - 1;
        } else {
          low = mid + 1;
        }
      }

      int start = low;

      // Last j where middle sum <= right sum
      low = i + 1;
      high = n - 2;

      while (low <= high) {
        int mid = (low + high) ~/ 2;

        int middle = prefix[mid] - prefix[i];
        int right = prefix[n - 1] - prefix[mid];

        if (middle <= right) {
          low = mid + 1;
        } else {
          high = mid - 1;
        }
      }

      int end = high;

      if (start <= end) {
        ans = (ans + (end - start + 1)) % MOD;
      }
    }

    return ans;
  }
}