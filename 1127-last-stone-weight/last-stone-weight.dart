import 'dart:math';

class Solution {
  int lastStoneWeight(List<int> stones) {
    stones.sort();

    while (stones.length > 1) {
      int y = stones.removeLast(); // largest
      int x = stones.removeLast(); // second largest

      if (y != x) {
        stones.add(y - x);
        stones.sort();
      }
    }

    return stones.isEmpty ? 0 : stones[0];
  }
}