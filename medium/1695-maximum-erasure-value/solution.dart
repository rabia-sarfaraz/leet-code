class Solution {
  int maximumUniqueSubarray(List<int> nums) {
    Set<int> seen = {};
    int left = 0;
    int sum = 0;
    int ans = 0;

    for (int right = 0; right < nums.length; right++) {
      while (seen.contains(nums[right])) {
        seen.remove(nums[left]);
        sum -= nums[left];
        left++;
      }

      seen.add(nums[right]);
      sum += nums[right];

      ans = ans > sum ? ans : sum;
    }

    return ans;
  }
}