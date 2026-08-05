class Solution {
  int maxWidthOfVerticalArea(List<List<int>> points) {
    List<int> xs = [];

    for (var point in points) {
      xs.add(point[0]);
    }

    xs.sort();

    int ans = 0;
    for (int i = 1; i < xs.length; i++) {
      ans = ans > (xs[i] - xs[i - 1]) ? ans : (xs[i] - xs[i - 1]);
    }

    return ans;
  }
}