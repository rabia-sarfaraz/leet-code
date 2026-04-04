class Solution {
  Map<String, List<int>> memo = {};

  List<int> diffWaysToCompute(String expression) {
    if (memo.containsKey(expression)) {
      return memo[expression]!;
    }

    List<int> result = [];

    for (int i = 0; i < expression.length; i++) {
      String ch = expression[i];

      if (ch == '+' || ch == '-' || ch == '*') {
        String leftExp = expression.substring(0, i);
        String rightExp = expression.substring(i + 1);

        List<int> left = diffWaysToCompute(leftExp);
        List<int> right = diffWaysToCompute(rightExp);

        for (int l in left) {
          for (int r in right) {
            if (ch == '+') {
              result.add(l + r);
            } else if (ch == '-') {
              result.add(l - r);
            } else if (ch == '*') {
              result.add(l * r);
            }
          }
        }
      }
    }

    // Agar koi operator nahi mila, to number hai
    if (result.isEmpty) {
      result.add(int.parse(expression));
    }

    memo[expression] = result;
    return result;
  }
}