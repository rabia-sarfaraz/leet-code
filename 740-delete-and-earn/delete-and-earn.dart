class Solution {
  int deleteAndEarn(List<int> nums) {
    if (nums.isEmpty) return 0;

    int maxNum = 0;
    for (int x in nums) {
      if (x > maxNum) maxNum = x;
    }

    List<int> sum = List.filled(maxNum + 1, 0);

    for (int x in nums) {
      sum[x] += x;
    }

    int prev2 = 0;
    int prev1 = 0;

    for (int i = 0; i <= maxNum; i++) {
      int take = prev2 + sum[i];
      int skip = prev1;

      int curr = take > skip ? take : skip;

      prev2 = prev1;
      prev1 = curr;
    }

    return prev1;
  }
}