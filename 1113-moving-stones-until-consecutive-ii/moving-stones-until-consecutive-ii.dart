class Solution {
  List<int> numMovesStonesII(List<int> stones) {
    stones.sort();
    int n = stones.length;

    // -------------------
    // MAX MOVES
    // -------------------
    int maxMoves = (stones[n - 1] - stones[1] - (n - 2)) >
            (stones[n - 2] - stones[0] - (n - 2))
        ? (stones[n - 1] - stones[1] - (n - 2))
        : (stones[n - 2] - stones[0] - (n - 2));

    // -------------------
    // MIN MOVES (Sliding Window)
    // -------------------
    int minMoves = n;
    int j = 0;

    for (int i = 0; i < n; i++) {
      while (j < n && stones[j] - stones[i] + 1 <= n) {
        j++;
      }

      int count = j - i;

      // special case (edge case)
      if (count == n - 1 &&
          stones[j - 1] - stones[i] + 1 == n - 1) {
        minMoves = minMoves < 2 ? minMoves : 2;
      } else {
        minMoves = minMoves < (n - count) ? minMoves : (n - count);
      }
    }

    return [minMoves, maxMoves];
  }
}