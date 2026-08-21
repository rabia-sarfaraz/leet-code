class Solution {
  List<int> constructDistancedSequence(int n) {
    int len = 2 * n - 1;
    List<int> ans = List.filled(len, 0);
    List<bool> used = List.filled(n + 1, false);

    bool backtrack(int index) {
      // Saari positions fill ho gayi
      if (index == len) {
        return true;
      }

      // Already filled position skip karo
      if (ans[index] != 0) {
        return backtrack(index + 1);
      }

      // Largest number se start karo
      for (int num = n; num >= 1; num--) {
        if (used[num]) continue;

        if (num == 1) {
          ans[index] = 1;
          used[1] = true;

          if (backtrack(index + 1)) {
            return true;
          }

          ans[index] = 0;
          used[1] = false;
        } else {
          int second = index + num;

          // Second position valid aur empty honi chahiye
          if (second >= len || ans[second] != 0) {
            continue;
          }

          ans[index] = num;
          ans[second] = num;
          used[num] = true;

          if (backtrack(index + 1)) {
            return true;
          }

          ans[index] = 0;
          ans[second] = 0;
          used[num] = false;
        }
      }

      return false;
    }

    backtrack(0);

    return ans;
  }
}