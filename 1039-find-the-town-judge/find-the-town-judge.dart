class Solution {
  int findJudge(int n, List<List<int>> trust) {
    List<int> indegree = List.filled(n + 1, 0);
    List<int> outdegree = List.filled(n + 1, 0);

    for (var t in trust) {
      int a = t[0];
      int b = t[1];
      outdegree[a]++;
      indegree[b]++;
    }

    for (int i = 1; i <= n; i++) {
      if (indegree[i] == n - 1 && outdegree[i] == 0) {
        return i;
      }
    }

    return -1;
  }
}