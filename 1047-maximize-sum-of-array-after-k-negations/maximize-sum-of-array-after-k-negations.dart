class Solution {
  int largestSumAfterKNegations(List<int> nums, int k) {
    nums.sort();

    int i = 0;

    // Step 1: Flip negatives
    while (i < nums.length && nums[i] < 0 && k > 0) {
      nums[i] = -nums[i];
      i++;
      k--;
    }

    // Step 2: Sort again (to find smallest)
    nums.sort();

    // Step 3: If k is odd → flip smallest
    if (k % 2 == 1) {
      nums[0] = -nums[0];
    }

    // Step 4: Sum
    int sum = 0;
    for (int num in nums) {
      sum += num;
    }

    return sum;
  }
}