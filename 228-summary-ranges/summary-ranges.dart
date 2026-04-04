class Solution {
  List<String> summaryRanges(List<int> nums) {
    List<String> result = [];

    if (nums.isEmpty) return result;

    int start = nums[0];

    for (int i = 1; i <= nums.length; i++) {
      if (i == nums.length || nums[i] != nums[i - 1] + 1) {
        if (start == nums[i - 1]) {
          result.add("$start");
        } else {
          result.add("$start->${nums[i - 1]}");
        }

        if (i < nums.length) {
          start = nums[i];
        }
      }
    }

    return result;
  }
}