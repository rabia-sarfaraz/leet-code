class Solution {
  String getHappyString(int n, int k) {
    List<String> result = [];

    void backtrack(String current) {
      if (result.length >= k) return;

      if (current.length == n) {
        result.add(current);
        return;
      }

      for (String ch in ['a', 'b', 'c']) {
        if (current.isEmpty || current[current.length - 1] != ch) {
          backtrack(current + ch);
        }
      }
    }

    backtrack("");

    return k <= result.length ? result[k - 1] : "";
  }
}