class Solution {
  List<int> findDuplicates(List<int> nums) {
    List<int> result = [];

    for (int i = 0; i < nums.length; i++) {
      int index = (nums[i].abs() - 1);

      if (nums[index] < 0) {
        result.add(nums[i].abs());
      } else {
        nums[index] = -nums[index];
      }
    }

    return result;
  }
}