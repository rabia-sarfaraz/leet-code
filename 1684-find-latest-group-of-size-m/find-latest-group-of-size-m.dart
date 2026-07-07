class Solution {
  int findLatestStep(List<int> arr, int m) {
    int n = arr.length;
    if (m == n) return n;

    List<int> length = List.filled(n + 2, 0);
    int count = 0;
    int ans = -1;

    for (int i = 0; i < n; i++) {
      int pos = arr[i];
      int left = length[pos - 1];
      int right = length[pos + 1];
      int newLen = left + right + 1;

      if (left == m) count--;
      if (right == m) count--;

      length[pos - left] = newLen;
      length[pos + right] = newLen;

      if (newLen == m) count++;

      if (count > 0) ans = i + 1;
    }

    return ans;
  }
}