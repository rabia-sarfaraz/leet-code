class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    candidates.sort();
    List<List<int>> result = [];

    void backtrack(int start, List<int> path, int remaining) {
      if (remaining == 0) {
        result.add(List.from(path));
        return;
      }

      for (int i = start; i < candidates.length; i++) {
        // skip duplicates at the same level
        if (i > start && candidates[i] == candidates[i - 1]) continue;

        if (candidates[i] > remaining) break;

        path.add(candidates[i]);

        // move to next index (no reuse)
        backtrack(i + 1, path, remaining - candidates[i]);

        path.removeLast();
      }
    }

    backtrack(0, [], target);
    return result;
  }
}