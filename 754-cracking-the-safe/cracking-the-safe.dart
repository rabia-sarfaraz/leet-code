class Solution {
  String crackSafe(int n, int k) {
    String start = '0' * (n - 1);
    Set<String> seen = {};
    StringBuffer result = StringBuffer();

    void dfs(String node) {
      for (int x = 0; x < k; x++) {
        String edge = node + x.toString();
        if (!seen.contains(edge)) {
          seen.add(edge);
          dfs(edge.substring(1));
          result.write(x);
        }
      }
    }

    dfs(start);
    result.write(start);

    return result.toString();
  }
}