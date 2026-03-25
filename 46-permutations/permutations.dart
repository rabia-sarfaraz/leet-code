class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> result = [];
    List<bool> used = List.filled(nums.length, false);

    void backtrack(List<int> path) {
      if (path.length == nums.length) {
        result.add(List.from(path));
        return;
      }

      for (int i = 0; i < nums.length; i++) {
        if (used[i]) continue;

        used[i] = true;
        path.add(nums[i]);

        backtrack(path);

        // backtrack
        path.removeLast();
        used[i] = false;
      }
    }

    backtrack([]);
    return result;
  }
}