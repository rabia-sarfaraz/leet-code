class Solution {
  int countRangeSum(List<int> nums, int lower, int upper) {
    int n = nums.length;

    List<int> prefix = List.filled(n + 1, 0);
    for (int i = 0; i < n; i++) {
      prefix[i + 1] = prefix[i] + nums[i];
    }

    return _mergeSort(prefix, 0, prefix.length - 1, lower, upper);
  }

  int _mergeSort(List<int> arr, int left, int right, int lower, int upper) {
    if (left >= right) return 0;

    int mid = (left + right) ~/ 2;

    int count = _mergeSort(arr, left, mid, lower, upper) +
        _mergeSort(arr, mid + 1, right, lower, upper);

    int j = mid + 1, k = mid + 1, t = mid + 1;
    List<int> temp = [];

    for (int i = left; i <= mid; i++) {
      while (k <= right && arr[k] - arr[i] < lower) k++;
      while (j <= right && arr[j] - arr[i] <= upper) j++;
      count += j - k;
    }

    // merge step
    int i = left, r = mid + 1;
    while (i <= mid && r <= right) {
      if (arr[i] <= arr[r]) {
        temp.add(arr[i++]);
      } else {
        temp.add(arr[r++]);
      }
    }

    while (i <= mid) temp.add(arr[i++]);
    while (r <= right) temp.add(arr[r++]);

    for (int x = 0; x < temp.length; x++) {
      arr[left + x] = temp[x];
    }

    return count;
  }
}