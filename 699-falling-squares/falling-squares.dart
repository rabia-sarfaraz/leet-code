class Solution {
  List<int> fallingSquares(List<List<int>> positions) {
    int n = positions.length;
    List<int> result = [];
    List<List<int>> squares = []; // [left, right, height]

    int globalMax = 0;

    for (var p in positions) {
      int left = p[0];
      int size = p[1];
      int right = left + size;

      int height = size;

      for (var s in squares) {
        int l = s[0];
        int r = s[1];
        int h = s[2];

        // check overlap
        if (left < r && right > l) {
          if (h + size > height) {
            height = h + size;
          }
        }
      }

      squares.add([left, right, height]);

      if (height > globalMax) {
        globalMax = height;
      }

      result.add(globalMax);
    }

    return result;
  }
}