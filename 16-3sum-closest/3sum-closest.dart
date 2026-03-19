class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int closestSum = nums[0] + nums[1] + nums[2];

    for (int i = 0; i < nums.length - 2; i++) {
      int left = i + 1;
      int right = nums.length - 1;

      while (left < right) {
        int sum = nums[i] + nums[left] + nums[right];

        // Update closest sum
        if ((sum - target).abs() < (closestSum - target).abs()) {
          closestSum = sum;
        }

        if (sum < target) {
          left++;
        } else if (sum > target) {
          right--;
        } else {
          // exact match mil gaya
          return sum;
        }
      }
    }

    return closestSum;
  }
}