class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();
    List<List<int>> result = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack(List<int> path) {
      if (path.length == nums.length) {
        result.add(List.from(path));
        return;
      }

      for (int i = 0; i < nums.length; i++) {
        if (used[i]) continue;

        // skip duplicates
        if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) continue;

        used[i] = true;
        path.add(nums[i]);

        backtrack(path);

        path.removeLast();
        used[i] = false;
      }
    }

    backtrack([]);
    return result;
  }
}