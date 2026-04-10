class Solution {
  int longestMountain(List<int> arr) {
    int n = arr.length;
    int ans = 0;

    int i = 1;

    while (i < n - 1) {
      // check if i is a peak
      if (arr[i] > arr[i - 1] && arr[i] > arr[i + 1]) {
        int left = i - 1;
        int right = i + 1;

        // go left (increasing part)
        while (left > 0 && arr[left] > arr[left - 1]) {
          left--;
        }

        // go right (decreasing part)
        while (right < n - 1 && arr[right] > arr[right + 1]) {
          right++;
        }

        ans = ans > (right - left + 1) ? ans : (right - left + 1);

        i = right; // skip processed part
      } else {
        i++;
      }
    }

    return ans;
  }
}