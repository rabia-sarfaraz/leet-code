class Solution {
  List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
    int oldColor = image[sr][sc];

    // agar same color hai to kuch change nahi
    if (oldColor == color) return image;

    int rows = image.length;
    int cols = image[0].length;

    void dfs(int r, int c) {
      if (r < 0 ||
          c < 0 ||
          r >= rows ||
          c >= cols ||
          image[r][c] != oldColor) {
        return;
      }

      image[r][c] = color;

      dfs(r + 1, c);
      dfs(r - 1, c);
      dfs(r, c + 1);
      dfs(r, c - 1);
    }

    dfs(sr, sc);
    return image;
  }
}