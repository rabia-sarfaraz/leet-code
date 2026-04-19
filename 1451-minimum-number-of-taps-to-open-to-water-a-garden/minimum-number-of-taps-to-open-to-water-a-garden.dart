class Solution {
  int minTaps(int n, List<int> ranges) {
    List<int> maxReach = List.filled(n + 1, 0);

    // Step 1: build max reach array
    for (int i = 0; i <= n; i++) {
      int left = (i - ranges[i]).clamp(0, n);
      int right = (i + ranges[i]).clamp(0, n);
      maxReach[left] = maxReach[left] > right ? maxReach[left] : right;
    }

    // Step 2: greedy jump
    int taps = 0;
    int currEnd = 0;
    int farthest = 0;

    for (int i = 0; i <= n; i++) {
      if (i > farthest) return -1;

      farthest = farthest > maxReach[i] ? farthest : maxReach[i];

      if (i == currEnd) {
        if (i != n) taps++;
        currEnd = farthest;
      }
    }

    return taps;
  }
}