class Solution {
  int earliestFinishTime(
    List<int> landStartTime,
    List<int> landDuration,
    List<int> waterStartTime,
    List<int> waterDuration,
  ) {
    int calc(
      List<int> start1,
      List<int> dur1,
      List<int> start2,
      List<int> dur2,
    ) {
      int minEnd = 1 << 60;

      for (int i = 0; i < start1.length; i++) {
        minEnd = minEnd < start1[i] + dur1[i]
            ? minEnd
            : start1[i] + dur1[i];
      }

      int ans = 1 << 60;

      for (int i = 0; i < start2.length; i++) {
        int finish = (minEnd > start2[i] ? minEnd : start2[i]) + dur2[i];
        ans = ans < finish ? ans : finish;
      }

      return ans;
    }

    int landToWater = calc(
      landStartTime,
      landDuration,
      waterStartTime,
      waterDuration,
    );

    int waterToLand = calc(
      waterStartTime,
      waterDuration,
      landStartTime,
      landDuration,
    );

    return landToWater < waterToLand ? landToWater : waterToLand;
  }
}