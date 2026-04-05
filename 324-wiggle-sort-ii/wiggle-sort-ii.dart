class Solution {
  void wiggleSort(List<int> nums) {
    nums.sort();

    int n = nums.length;
    List<int> temp = List.filled(n, 0);

    int left = (n - 1) ~/ 2;
    int right = n - 1;

    int idx = 0;

    // fill odd positions with larger half
    for (int i = 1; i < n; i += 2) {
      temp[i] = nums[right--];
    }

    // fill even positions with smaller half
    for (int i = 0; i < n; i += 2) {
      temp[i] = nums[left--];
    }

    for (int i = 0; i < n; i++) {
      nums[i] = temp[i];
    }
  }
}