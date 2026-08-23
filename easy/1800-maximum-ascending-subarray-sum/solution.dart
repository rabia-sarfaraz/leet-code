class Solution {
  int maxAscendingSum(List<int> nums) {
    int current = nums[0];
    int answer = nums[0];

    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > nums[i - 1]) {
        current += nums[i];
      } else {
        current = nums[i];
      }

      if (current > answer) {
        answer = current;
      }
    }

    return answer;
  }
}