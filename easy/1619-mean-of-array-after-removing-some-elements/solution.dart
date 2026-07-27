class Solution {
  double trimMean(List<int> arr) {
    arr.sort();

    int n = arr.length;
    int remove = n ~/ 20; // 5%

    int sum = 0;
    for (int i = remove; i < n - remove; i++) {
      sum += arr[i];
    }

    return sum / (n - 2 * remove);
  }
}