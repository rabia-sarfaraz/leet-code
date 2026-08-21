class Solution {
  int maxResult(List<int> nums, int k) {
    int n = nums.length;
    List<int> deque = [0];

    for (int i = 1; i < n; i++) {
      // Front se indices remove karo jo window se bahar hain
      while (deque.isNotEmpty && deque.first < i - k) {
        deque.removeAt(0);
      }

      // Current value + best previous score
      nums[i] += nums[deque.first];

      // Back se smaller scores remove karo
      while (deque.isNotEmpty &&
          nums[deque.last] <= nums[i]) {
        deque.removeLast();
      }

      deque.add(i);
    }

    return nums[n - 1];
  }
}