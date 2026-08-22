class Solution {
  bool checkPartitioning(String s) {
    int n = s.length;

    // palindrome[i][j] = s[i...j] palindrome hai ya nahi
    List<List<bool>> palindrome =
        List.generate(n, (_) => List.filled(n, false));

    for (int i = n - 1; i >= 0; i--) {
      for (int j = i; j < n; j++) {
        if (s[i] == s[j] &&
            (j - i <= 2 || palindrome[i + 1][j - 1])) {
          palindrome[i][j] = true;
        }
      }
    }

    // Exactly 3 non-empty parts
    for (int i = 0; i < n - 2; i++) {
      if (!palindrome[0][i]) continue;

      for (int j = i + 1; j < n - 1; j++) {
        if (palindrome[i + 1][j] &&
            palindrome[j + 1][n - 1]) {
          return true;
        }
      }
    }

    return false;
  }
}