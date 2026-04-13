class Solution {
  int longestOnes(List<int> nums, int k) {
    int left = 0;
    int zeroCount = 0;
    int maxLen = 0;

    for (int right = 0; right < nums.length; right++) {
      if (nums[right] == 0) zeroCount++;

      // shrink window if invalid
      while (zeroCount > k) {
        if (nums[left] == 0) zeroCount--;
        left++;
      }

      maxLen = (right - left + 1) > maxLen 
          ? (right - left + 1) 
          : maxLen;
    }

    return maxLen;
  }
}