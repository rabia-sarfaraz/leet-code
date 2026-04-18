class Solution {
  int maxSumDivThree(List<int> nums) {
    List<int> dp = [0, -1000000000, -1000000000];

    for (int num in nums) {
      List<int> newDp = List.from(dp);

      for (int i = 0; i < 3; i++) {
        int newSum = dp[i] + num;
        int mod = newSum % 3;

        if (newSum > newDp[mod]) {
          newDp[mod] = newSum;
        }
      }

      dp = newDp;
    }

    return dp[0];
  }
}