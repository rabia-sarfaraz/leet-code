class Solution {
  List<int> pancakeSort(List<int> arr) {
    List<int> res = [];
    int n = arr.length;

    for (int size = n; size > 1; size--) {
      // find index of max element in arr[0..size-1]
      int maxIdx = 0;
      for (int i = 1; i < size; i++) {
        if (arr[i] > arr[maxIdx]) {
          maxIdx = i;
        }
      }

      // if already in correct position
      if (maxIdx == size - 1) continue;

      // step 1: bring max to front
      if (maxIdx != 0) {
        _flip(arr, maxIdx);
        res.add(maxIdx + 1);
      }

      // step 2: bring it to correct position
      _flip(arr, size - 1);
      res.add(size);
    }

    return res;
  }

  void _flip(List<int> arr, int k) {
    int i = 0, j = k;
    while (i < j) {
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      i++;
      j--;
    }
  }
}