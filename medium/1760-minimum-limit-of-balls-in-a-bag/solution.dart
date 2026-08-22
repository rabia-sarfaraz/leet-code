class Solution {
  int minimumSize(List<int> nums, int maxOperations) {
    int low = 1;
    int high = nums.reduce((a, b) => a > b ? a : b);

    while (low < high) {
      int mid = (low + high) ~/ 2;
      int operations = 0;

      for (int num in nums) {
        // Is bag ko size <= mid banane ke liye
        // kitni operations chahiye
        operations += (num - 1) ~/ mid;

        if (operations > maxOperations) {
          break;
        }
      }

      if (operations <= maxOperations) {
        high = mid;
      } else {
        low = mid + 1;
      }
    }

    return low;
  }
}