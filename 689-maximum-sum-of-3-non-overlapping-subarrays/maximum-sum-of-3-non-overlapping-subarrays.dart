class Solution {
  List<int> maxSumOfThreeSubarrays(List<int> nums, int k) {
    int n = nums.length;

    List<int> sum = List.filled(n + 1, 0);

    // prefix sum
    for (int i = 0; i < n; i++) {
      sum[i + 1] = sum[i] + nums[i];
    }

    // window sums
    List<int> window = List.filled(n - k + 1, 0);
    for (int i = 0; i <= n - k; i++) {
      window[i] = sum[i + k] - sum[i];
    }

    List<int> left = List.filled(window.length, 0);
    int best = 0;

    for (int i = 0; i < window.length; i++) {
      if (window[i] > window[best]) {
        best = i;
      }
      left[i] = best;
    }

    List<int> right = List.filled(window.length, 0);
    best = window.length - 1;

    for (int i = window.length - 1; i >= 0; i--) {
      if (window[i] >= window[best]) {
        best = i;
      }
      right[i] = best;
    }

    List<int> ans = [];
    int maxSum = 0;

    for (int mid = k; mid < window.length - k; mid++) {
      int l = left[mid - k];
      int r = right[mid + k];

      int total = window[l] + window[mid] + window[r];

      if (total > maxSum) {
        maxSum = total;
        ans = [l, mid, r];
      }
    }

    return ans;
  }
}