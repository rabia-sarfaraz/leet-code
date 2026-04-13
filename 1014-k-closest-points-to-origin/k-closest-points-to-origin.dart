class Solution {
  List<List<int>> kClosest(List<List<int>> points, int k) {
    // sort based on distance from origin
    points.sort((a, b) {
      int distA = a[0]*a[0] + a[1]*a[1];
      int distB = b[0]*b[0] + b[1]*b[1];
      return distA.compareTo(distB);
    });

    return points.sublist(0, k);
  }
}