class Solution {
  int maxSumTwoNoOverlap(List<int> nums, int firstLen, int secondLen) {
    return _helper(nums, firstLen, secondLen)
        .compareTo(_helper(nums, secondLen, firstLen)) > 0
        ? _helper(nums, firstLen, secondLen)
        : _helper(nums, secondLen, firstLen);
  }

  int _helper(List<int> nums, int L, int M) {
    int n = nums.length;

    int sumL = 0;
    for (int i = 0; i < L; i++) {
      sumL += nums[i];
    }

    int bestL = sumL;
    int sumM = 0;
    int result = 0;

    // M starts after L
    for (int i = L; i < n; i++) {
      sumM += nums[i];

      if (i >= L + M) {
        sumM -= nums[i - M];
      }

      if (i >= L + M - 1) {
        bestL = bestL > sumL ? bestL : sumL;
        result = result > (bestL + sumM) ? result : (bestL + sumM);

        sumL += nums[i - M + 1] - nums[i - M + 1 - L];
      }
    }

    return result;
  }
}