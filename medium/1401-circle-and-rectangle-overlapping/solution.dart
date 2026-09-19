class Solution {
  bool checkOverlap(
    int radius,
    int xCenter,
    int yCenter,
    int x1,
    int y1,
    int x2,
    int y2,
  ) {
    // Circle ke center ke nearest rectangle point ko find karo
    int closestX = xCenter.clamp(x1, x2);
    int closestY = yCenter.clamp(y1, y2);

    int dx = xCenter - closestX;
    int dy = yCenter - closestY;

    return dx * dx + dy * dy <= radius * radius;
  }
}