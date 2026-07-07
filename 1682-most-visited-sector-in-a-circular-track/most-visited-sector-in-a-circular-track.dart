class Solution {
  List<int> mostVisited(int n, List<int> rounds) {
    int start = rounds.first;
    int end = rounds.last;

    List<int> ans = [];

    if (start <= end) {
      for (int i = start; i <= end; i++) {
        ans.add(i);
      }
    } else {
      for (int i = 1; i <= end; i++) {
        ans.add(i);
      }
      for (int i = start; i <= n; i++) {
        ans.add(i);
      }
    }

    return ans;
  }
}