class Solution {
  int findMaxConsecutiveOnes(List<int> nums) {
    int maxCount = 0;
    int currentCount = 0;

    for (int num in nums) {
      if (num == 1) {
        currentCount++;
        if (currentCount > maxCount) {
          maxCount = currentCount;
        }
      } else {
        currentCount = 0;
      }
    }

    return maxCount;
  }
}