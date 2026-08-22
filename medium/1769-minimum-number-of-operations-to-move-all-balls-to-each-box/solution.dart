class Solution {
  List<int> minOperations(String boxes) {
    int n = boxes.length;
    List<int> ans = List.filled(n, 0);

    int balls = 0;
    int moves = 0;

    // Left side se
    for (int i = 0; i < n; i++) {
      ans[i] += moves;

      if (boxes[i] == '1') {
        balls++;
      }

      moves += balls;
    }

    balls = 0;
    moves = 0;

    // Right side se
    for (int i = n - 1; i >= 0; i--) {
      ans[i] += moves;

      if (boxes[i] == '1') {
        balls++;
      }

      moves += balls;
    }

    return ans;
  }
}