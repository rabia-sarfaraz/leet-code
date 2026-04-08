class Solution {
  List<int> findClosestElements(List<int> arr, int k, int x) {
    int left = 0;
    int right = arr.length - k;

    while (left < right) {
      int mid = (left + right) ~/ 2;

      if (x - arr[mid] > arr[mid + k] - x) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }

    return arr.sublist(left, left + k);
  }
}