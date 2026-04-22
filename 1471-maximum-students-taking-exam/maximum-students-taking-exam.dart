class Solution {
  int maxStudents(List<List<String>> seats) {
    int m = seats.length;
    int n = seats[0].length;

    List<List<int>> validMasks = [];

    // Step 1: generate valid masks for each row
    for (int i = 0; i < m; i++) {
      List<int> masks = [];

      for (int mask = 0; mask < (1 << n); mask++) {
        bool ok = true;

        for (int j = 0; j < n; j++) {
          // seat broken
          if (((mask >> j) & 1) == 1 && seats[i][j] == '#') {
            ok = false;
            break;
          }
          // adjacent students
          if (j > 0 && ((mask >> j) & 1) == 1 && ((mask >> (j - 1)) & 1) == 1) {
            ok = false;
            break;
          }
        }

        if (ok) masks.add(mask);
      }

      validMasks.add(masks);
    }

    Map<String, int> dp = {};
    dp["0#0"] = 0;

    for (int i = 0; i < m; i++) {
      Map<String, int> newDp = {};

      for (int mask in validMasks[i]) {
        int bits = _countBits(mask);

        for (var key in dp.keys) {
          int prevMask = int.parse(key.split('#')[1]);

          // check diagonal cheating
          if ((mask & (prevMask << 1)) != 0) continue;
          if ((mask & (prevMask >> 1)) != 0) continue;

          int val = dp[key]! + bits;
          String newKey = "$i#$mask";

          newDp[newKey] = newDp.containsKey(newKey)
              ? (newDp[newKey]! > val ? newDp[newKey]! : val)
              : val;
        }
      }

      dp = newDp;
    }

    int res = 0;
    for (int v in dp.values) {
      if (v > res) res = v;
    }

    return res;
  }

  int _countBits(int x) {
    int count = 0;
    while (x > 0) {
      count += x & 1;
      x >>= 1;
    }
    return count;
  }
}