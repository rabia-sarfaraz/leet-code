class Solution {
  int maxDistance(List<int> colors) {
    int n = colors.length;
    int maxDist = 0;

    // Compare with first element
    for (int i = 0; i < n; i++) {
      if (colors[i] != colors[0]) {
        maxDist = maxDist > i ? maxDist : i;
      }
    }

    // Compare with last element
    for (int i = n - 1; i >= 0; i--) {
      if (colors[i] != colors[n - 1]) {
        int dist = (n - 1 - i);
        maxDist = maxDist > dist ? maxDist : dist;
      }
    }

    return maxDist;
  }
}