class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = [];

    void backtrack(String current, int open, int close) {
      if (current.length == 2 * n) {
        result.add(current);
        return;
      }

      // Opening bracket add kar sakte hain
      if (open < n) {
        backtrack(current + '(', open + 1, close);
      }

      // Closing bracket tabhi jab open brackets zyada hon
      if (close < open) {
        backtrack(current + ')', open, close + 1);
      }
    }

    backtrack('', 0, 0);

    return result;
  }
}