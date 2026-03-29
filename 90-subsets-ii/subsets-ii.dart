class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort();
    List<List<int>> result = [];

    void backtrack(int start, List<int> path) {
      result.add(List.from(path));

      for (int i = start; i < nums.length; i++) {
        // skip duplicates
        if (i > start && nums[i] == nums[i - 1]) continue;

        path.add(nums[i]);
        backtrack(i + 1, path);
        path.removeLast();
      }
    }

    backtrack(0, []);
    return result;
  }
}