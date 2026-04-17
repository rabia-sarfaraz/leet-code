class Solution {
  List<List<int>> minimumAbsDifference(List<int> arr) {
    arr.sort();

    int minDiff = 1 << 30;
    List<List<int>> result = [];

    for (int i = 1; i < arr.length; i++) {
      int diff = arr[i] - arr[i - 1];

      if (diff < minDiff) {
        minDiff = diff;
        result.clear();
        result.add([arr[i - 1], arr[i]]);
      } else if (diff == minDiff) {
        result.add([arr[i - 1], arr[i]]);
      }
    }

    return result;
  }
}