class Solution {
  List<List<int>> findSubsequences(List<int> nums) {
    List<List<int>> res = [];

    void backtrack(int start, List<int> path) {
      if (path.length >= 2) {
        res.add(List.from(path));
      }

      Set<int> used = {};

      for (int i = start; i < nums.length; i++) {
        if (used.contains(nums[i])) continue;

        if (path.isEmpty || nums[i] >= path.last) {
          used.add(nums[i]);
          path.add(nums[i]);

          backtrack(i + 1, path);

          path.removeLast();
        }
      }
    }

    backtrack(0, []);
    return res;
  }
}