class Solution {
  int minSumOfLengths(List<int> arr, int target) {
    int n = arr.length;

    List<int> best = List.filled(n, 1 << 30);

    int left = 0;
    int sum = 0;

    int ans = 1 << 30;
    int minLen = 1 << 30;

    for (int right = 0; right < n; right++) {
      sum += arr[right];

      while (sum > target) {
        sum -= arr[left];
        left++;
      }

      if (sum == target) {
        int len = right - left + 1;

        // combine with previous best subarray
        if (left > 0 && best[left - 1] != (1 << 30)) {
          ans = ans < len + best[left - 1]
              ? ans
              : len + best[left - 1];
        }

        // update minimum length so far
        minLen = minLen < len ? minLen : len;
      }

      best[right] = minLen;
    }

    return ans == (1 << 30) ? -1 : ans;
  }
}