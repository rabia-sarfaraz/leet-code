class Solution {
  List<List<int>> spiralMatrixIII(int rows, int cols, int rStart, int cStart) {
    List<List<int>> res = [];

    int total = rows * cols;
    int count = 0;

    List<int> dr = [0, 1, 0, -1]; // right, down, left, up
    List<int> dc = [1, 0, -1, 0];

    int r = rStart;
    int c = cStart;

    int step = 1;
    int dir = 0;

    res.add([r, c]);
    count++;

    while (count < total) {
      for (int i = 0; i < 2; i++) {
        for (int j = 0; j < step; j++) {
          r += dr[dir];
          c += dc[dir];

          if (r >= 0 && r < rows && c >= 0 && c < cols) {
            res.add([r, c]);
            count++;
          }
        }

        dir = (dir + 1) % 4;
      }

      step++;
    }

    return res;
  }
}