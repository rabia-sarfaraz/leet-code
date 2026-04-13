class Solution {
  int minDominoRotations(List<int> tops, List<int> bottoms) {
    int check(int target) {
      int rotateTop = 0;
      int rotateBottom = 0;

      for (int i = 0; i < tops.length; i++) {
        // If neither has target → impossible
        if (tops[i] != target && bottoms[i] != target) {
          return -1;
        }

        // Count rotations
        if (tops[i] != target) rotateTop++;
        if (bottoms[i] != target) rotateBottom++;
      }

      return rotateTop < rotateBottom ? rotateTop : rotateBottom;
    }

    int res1 = check(tops[0]);
    int res2 = check(bottoms[0]);

    if (res1 == -1) return res2;
    if (res2 == -1) return res1;

    return res1 < res2 ? res1 : res2;
  }
}