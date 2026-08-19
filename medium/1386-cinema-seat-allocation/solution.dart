class Solution {
  int maxNumberOfFamilies(int n, List<List<int>> reservedSeats) {
    Map<int, int> rows = {};

    // Store reserved seats for each row using a bitmask
    for (var seat in reservedSeats) {
      int row = seat[0];
      int col = seat[1];

      if (col >= 2 && col <= 9) {
        rows[row] = (rows[row] ?? 0) | (1 << col);
      }
    }

    int answer = (n - rows.length) * 2;

    for (var mask in rows.values) {
      bool left = (mask & ((1 << 2) | (1 << 3) | (1 << 4) | (1 << 5))) == 0;
      bool middle = (mask & ((1 << 4) | (1 << 5) | (1 << 6) | (1 << 7))) == 0;
      bool right = (mask & ((1 << 6) | (1 << 7) | (1 << 8) | (1 << 9))) == 0;

      if (left && right) {
        answer += 2;
      } else if (left || middle || right) {
        answer += 1;
      }
    }

    return answer;
  }
}