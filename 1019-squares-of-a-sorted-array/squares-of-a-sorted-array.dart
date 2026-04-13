class Solution {
  List<int> sortedSquares(List<int> nums) {
    int n = nums.length;
    List<int> res = List.filled(n, 0);

    int left = 0;
    int right = n - 1;
    int pos = n - 1;

    while (left <= right) {
      int leftSq = nums[left] * nums[left];
      int rightSq = nums[right] * nums[right];

      if (leftSq > rightSq) {
        res[pos] = leftSq;
        left++;
      } else {
        res[pos] = rightSq;
        right--;
      }
      pos--;
    }

    return res;
  }
}