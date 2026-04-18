class Solution {
  int findSpecialInteger(List<int> arr) {
    int n = arr.length;
    int threshold = n ~/ 4;

    for (int i = 0; i < n; i++) {
      int count = 1;

      while (i + 1 < n && arr[i] == arr[i + 1]) {
        count++;
        i++;
      }

      if (count > threshold) {
        return arr[i];
      }
    }

    return -1;
  }
}