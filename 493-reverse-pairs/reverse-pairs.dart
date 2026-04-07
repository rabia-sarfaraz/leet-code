class Solution {
  int reversePairs(List<int> nums) {
    return mergeSort(nums, 0, nums.length - 1);
  }

  int mergeSort(List<int> nums, int left, int right) {
    if (left >= right) return 0;

    int mid = (left + right) ~/ 2;

    int count = 0;
    count += mergeSort(nums, left, mid);
    count += mergeSort(nums, mid + 1, right);
    count += countPairs(nums, left, mid, right);
    merge(nums, left, mid, right);

    return count;
  }

  int countPairs(List<int> nums, int left, int mid, int right) {
    int count = 0;
    int j = mid + 1;

    for (int i = left; i <= mid; i++) {
      while (j <= right && nums[i] > 2.0 * nums[j]) {
        j++;
      }
      count += (j - (mid + 1));
    }

    return count;
  }

  void merge(List<int> nums, int left, int mid, int right) {
    List<int> temp = [];

    int i = left;
    int j = mid + 1;

    while (i <= mid && j <= right) {
      if (nums[i] <= nums[j]) {
        temp.add(nums[i++]);
      } else {
        temp.add(nums[j++]);
      }
    }

    while (i <= mid) temp.add(nums[i++]);
    while (j <= right) temp.add(nums[j++]);

    for (int k = 0; k < temp.length; k++) {
      nums[left + k] = temp[k];
    }
  }
}