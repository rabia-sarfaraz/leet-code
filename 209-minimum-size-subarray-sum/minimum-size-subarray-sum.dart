class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int left = 0;
    int sum = 0;
    int minLen = 1 << 30; // large number

    for (int right = 0; right < nums.length; right++) {
      sum += nums[right];

      while (sum >= target) {
        int currentLen = right - left + 1;
        if (currentLen < minLen) {
          minLen = currentLen;
        }

        sum -= nums[left];
        left++;
      }
    }

    return minLen == (1 << 30) ? 0 : minLen;
  }
}