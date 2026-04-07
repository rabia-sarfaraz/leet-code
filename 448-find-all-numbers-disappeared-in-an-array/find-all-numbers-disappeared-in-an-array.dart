class Solution {
  List<int> findDisappearedNumbers(List<int> nums) {
    int n = nums.length;

    // Step 1: mark visited
    for (int i = 0; i < n; i++) {
      int index = nums[i].abs() - 1;
      if (nums[index] > 0) {
        nums[index] = -nums[index];
      }
    }

    // Step 2: collect missing
    List<int> result = [];
    for (int i = 0; i < n; i++) {
      if (nums[i] > 0) {
        result.add(i + 1);
      }
    }

    return result;
  }
}