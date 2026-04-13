class Solution {
  int maxTurbulenceSize(List<int> arr) {
    int n = arr.length;
    if (n == 1) return 1;

    int left = 0;
    int maxLen = 1;

    for (int right = 1; right < n; right++) {
      int cmp = arr[right].compareTo(arr[right - 1]);

      if (cmp == 0) {
        left = right;
      } else if (
        right == n - 1 ||
        cmp * arr[right + 1].compareTo(arr[right]) != -1
      ) {
        maxLen = maxLen > (right - left + 1)
            ? maxLen
            : (right - left + 1);
        left = right;
      }
    }

    return maxLen;
  }
}