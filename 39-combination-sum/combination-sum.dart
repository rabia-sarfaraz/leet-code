class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    List<List<int>> result = [];

    void backtrack(int start, List<int> path, int remaining) {
      if (remaining == 0) {
        result.add(List.from(path));
        return;
      }

      if (remaining < 0) return;

      for (int i = start; i < candidates.length; i++) {
        path.add(candidates[i]);

        // same element reuse allowed → i (not i+1)
        backtrack(i, path, remaining - candidates[i]);

        path.removeLast(); // backtrack
      }
    }

    backtrack(0, [], target);
    return result;
  }
}