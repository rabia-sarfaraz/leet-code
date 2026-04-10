class Solution {
  bool isRectangleOverlap(List<int> rec1, List<int> rec2) {
    return !(rec1[2] <= rec2[0] ||  // left
             rec1[0] >= rec2[2] ||  // right
             rec1[3] <= rec2[1] ||  // bottom
             rec1[1] >= rec2[3]);   // top
  }
}