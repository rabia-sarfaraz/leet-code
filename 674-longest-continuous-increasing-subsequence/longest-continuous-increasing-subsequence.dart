class Solution {
  int findLengthOfLCIS(List<int> nums) {
    if (nums.isEmpty) return 0;

    int maxLen = 1;
    int currLen = 1;

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        currLen++;
      } else {
        currLen = 1;
      }
      if (currLen > maxLen) {
        maxLen = currLen;
      }
    }

    return maxLen;
  }
}