import 'dart:collection';

class Solution {
  int longestSubarray(List<int> nums, int limit) {
    Queue<int> maxDeque = Queue<int>();
    Queue<int> minDeque = Queue<int>();

    int left = 0;
    int ans = 0;

    for (int right = 0; right < nums.length; right++) {

      // Maintain decreasing deque for maximum
      while (maxDeque.isNotEmpty &&
          nums[maxDeque.last] < nums[right]) {
        maxDeque.removeLast();
      }

      // Maintain increasing deque for minimum
      while (minDeque.isNotEmpty &&
          nums[minDeque.last] > nums[right]) {
        minDeque.removeLast();
      }

      maxDeque.addLast(right);
      minDeque.addLast(right);

      // Shrink window if condition breaks
      while (nums[maxDeque.first] - nums[minDeque.first] > limit) {

        if (maxDeque.first == left) {
          maxDeque.removeFirst();
        }

        if (minDeque.first == left) {
          minDeque.removeFirst();
        }

        left++;
      }

      ans = ans > (right - left + 1)
          ? ans
          : (right - left + 1);
    }

    return ans;
  }
}