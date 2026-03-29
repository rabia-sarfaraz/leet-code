class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> result = [];

    void backtrack(int start, List<int> current) {
      if (current.length == k) {
        result.add(List.from(current));
        return;
      }

      for (int i = start; i <= n; i++) {
        current.add(i);
        backtrack(i + 1, current);
        current.removeLast();
      }
    }

    backtrack(1, []);
    return result;
  }
}