class Solution {
  List<int> numsSameConsecDiff(int n, int k) {
    List<int> result = [];

    void dfs(int num, int len) {
      if (len == n) {
        result.add(num);
        return;
      }

      int lastDigit = num % 10;

      List<int> nextDigits = [];

      int d1 = lastDigit + k;
      int d2 = lastDigit - k;

      if (d1 >= 0 && d1 <= 9) nextDigits.add(d1);
      if (d2 >= 0 && d2 <= 9 && k != 0) nextDigits.add(d2);

      for (int nd in nextDigits) {
        dfs(num * 10 + nd, len + 1);
      }
    }

    for (int i = 1; i <= 9; i++) {
      dfs(i, 1);
    }

    return result;
  }
}