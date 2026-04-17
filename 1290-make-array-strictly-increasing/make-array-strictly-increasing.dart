class Solution {
  int makeArrayIncreasing(List<int> arr1, List<int> arr2) {
    // sort + unique arr2
    arr2 = arr2.toSet().toList()..sort();

    Map<int, int> dp = {-1: 0};

    for (int num in arr1) {
      Map<int, int> newDp = {};

      for (var entry in dp.entries) {
        int prev = entry.key;
        int ops = entry.value;

        // 1. keep
        if (num > prev) {
          int val = num;
          if (!newDp.containsKey(val) || newDp[val]! > ops) {
            newDp[val] = ops;
          }
        }

        // 2. replace
        int idx = _upperBound(arr2, prev);
        if (idx < arr2.length) {
          int val = arr2[idx];
          if (!newDp.containsKey(val) || newDp[val]! > ops + 1) {
            newDp[val] = ops + 1;
          }
        }
      }

      if (newDp.isEmpty) return -1;
      dp = newDp;
    }

    return dp.values.reduce((a, b) => a < b ? a : b);
  }

  int _upperBound(List<int> arr, int target) {
    int l = 0, r = arr.length;
    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (arr[mid] <= target) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    return l;
  }
}