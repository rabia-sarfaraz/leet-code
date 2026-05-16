class Solution {
  int maxArea(
      int h,
      int w,
      List<int> horizontalCuts,
      List<int> verticalCuts) {

    const int mod = 1000000007;

    horizontalCuts.sort();
    verticalCuts.sort();

    int maxH = horizontalCuts[0];
    int maxV = verticalCuts[0];

    // Maximum horizontal gap
    for (int i = 1; i < horizontalCuts.length; i++) {
      maxH = max(
        maxH,
        horizontalCuts[i] - horizontalCuts[i - 1],
      );
    }

    // Bottom edge
    maxH = max(
      maxH,
      h - horizontalCuts.last,
    );

    // Maximum vertical gap
    for (int i = 1; i < verticalCuts.length; i++) {
      maxV = max(
        maxV,
        verticalCuts[i] - verticalCuts[i - 1],
      );
    }

    // Right edge
    maxV = max(
      maxV,
      w - verticalCuts.last,
    );

    return ((maxH * maxV) % mod);
  }

  int max(int a, int b) {
    return a > b ? a : b;
  }
}