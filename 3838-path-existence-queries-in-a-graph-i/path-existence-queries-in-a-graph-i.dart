class Solution {
  List<bool> pathExistenceQueries(
      int n,
      List<int> nums,
      int maxDiff,
      List<List<int>> queries) {

    List<int> comp = List.filled(n, 0);

    int id = 0;
    comp[0] = 0;

    for (int i = 1; i < n; i++) {
      if (nums[i] - nums[i - 1] > maxDiff) {
        id++;
      }
      comp[i] = id;
    }

    List<bool> ans = [];

    for (var q in queries) {
      ans.add(comp[q[0]] == comp[q[1]]);
    }

    return ans;
  }
}