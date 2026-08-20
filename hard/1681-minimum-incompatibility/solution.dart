class Solution {
  int minimumIncompatibility(List<int> nums, int k) {
    int n = nums.length;
    int groupSize = n ~/ k;

    nums.sort();

    // If any number occurs more than k times,
    // it is impossible to distribute them.
    Map<int, int> freq = {};

    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;

      if (freq[num]! > k) {
        return -1;
      }
    }

    int totalMasks = 1 << n;
    const int INF = 1000000000;

    List<int> groupCost = List.filled(totalMasks, -1);

    // Calculate incompatibility of every possible group
    for (int mask = 0; mask < totalMasks; mask++) {
      if (_bitCount(mask) != groupSize) {
        continue;
      }

      int first = -1;
      int last = -1;
      bool valid = true;
      Set<int> seen = {};

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) != 0) {
          if (seen.contains(nums[i])) {
            valid = false;
            break;
          }

          seen.add(nums[i]);

          if (first == -1) {
            first = nums[i];
          }

          last = nums[i];
        }
      }

      if (valid) {
        groupCost[mask] = last - first;
      }
    }

    List<int> dp = List.filled(totalMasks, INF);
    dp[0] = 0;

    for (int mask = 0; mask < totalMasks; mask++) {
      if (dp[mask] == INF) {
        continue;
      }

      int used = _bitCount(mask);

      if (used == n) {
        continue;
      }

      // First unused element
      int firstUnused = -1;

      for (int i = 0; i < n; i++) {
        if ((mask & (1 << i)) == 0) {
          firstUnused = i;
          break;
        }
      }

      // Try all groups containing first unused element
      for (int group = 0; group < totalMasks; group++) {
        if ((group & (1 << firstUnused)) == 0) {
          continue;
        }

        if ((group & mask) != 0) {
          continue;
        }

        if (groupCost[group] == -1) {
          continue;
        }

        int newMask = mask | group;

        dp[newMask] = min(
          dp[newMask],
          dp[mask] + groupCost[group],
        );
      }
    }

    return dp[totalMasks - 1];
  }

  int _bitCount(int x) {
    int count = 0;

    while (x != 0) {
      count += x & 1;
      x >>= 1;
    }

    return count;
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }
}