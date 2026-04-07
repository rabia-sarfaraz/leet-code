class Solution {
  int countArrangement(int n) {
    List<bool> used = List.filled(n + 1, false);

    int backtrack(int pos) {
      if (pos > n) return 1;

      int count = 0;

      for (int num = 1; num <= n; num++) {
        if (!used[num] &&
            (num % pos == 0 || pos % num == 0)) {
          used[num] = true;
          count += backtrack(pos + 1);
          used[num] = false;
        }
      }

      return count;
    }

    return backtrack(1);
  }
}