import 'dart:collection';

class Solution {
  int minKBitFlips(List<int> nums, int k) {
    int n = nums.length;
    Queue<int> q = Queue(); // stores flip end positions
    int flips = 0;

    for (int i = 0; i < n; i++) {
      // remove expired flips
      if (q.isNotEmpty && q.first == i) {
        q.removeFirst();
      }

      // current bit after flips
      bool isFlipped = q.length % 2 == 1;
      int current = nums[i];

      if (isFlipped) {
        current = current ^ 1;
      }

      // if we see 0, we must flip
      if (current == 0) {
        if (i + k > n) return -1;

        flips++;
        q.add(i + k);
      }
    }

    return flips;
  }
}