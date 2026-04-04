class Solution {
  List<List<int>> combinationSum3(int k, int n) {
    List<List<int>> result = [];
    List<int> path = [];

    void backtrack(int start, int sum) {
      // base cases
      if (path.length == k) {
        if (sum == n) {
          result.add(List.from(path));
        }
        return;
      }

      for (int i = start; i <= 9; i++) {
        if (sum + i > n) continue;

        path.add(i);
        backtrack(i + 1, sum + i);
        path.removeLast();
      }
    }

    backtrack(1, 0);
    return result;
  }
}