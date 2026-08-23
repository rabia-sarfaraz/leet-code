class Solution {
  int minChanges(List<int> nums, int k) {
    const int MAXX = 1024;
    const int INF = 1000000000;

    int n = nums.length;

    List<int> dp = List.filled(MAXX, INF);
    dp[0] = 0;

    for (int i = 0; i < k; i++) {
      Map<int, int> freq = {};
      int size = 0;

      // Elements at positions i, i+k, i+2k...
      for (int j = i; j < n; j += k) {
        freq[nums[j]] = (freq[nums[j]] ?? 0) + 1;
        size++;
      }

      List<int> ndp = List.filled(MAXX, INF);

      // Change every element in this group
      int minDp = dp.reduce((a, b) => a < b ? a : b);

      // Try changing the whole group to arbitrary values
      for (int x = 0; x < MAXX; x++) {
        ndp[x] = minDp + size;
      }

      // Keep an existing value
      for (var entry in freq.entries) {
        int value = entry.key;
        int count = entry.value;

        for (int prevXor = 0; prevXor < MAXX; prevXor++) {
          if (dp[prevXor] == INF) continue;

          int newXor = prevXor ^ value;

          int cost = dp[prevXor] + size - count;

          if (cost < ndp[newXor]) {
            ndp[newXor] = cost;
          }
        }
      }

      dp = ndp;
    }

    return dp[0];
  }
}