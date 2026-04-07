class Solution {
  bool detectCapitalUse(String word) {
    int n = word.length;

    bool isAllUpper = true;
    bool isAllLower = true;

    for (int i = 0; i < n; i++) {
      if (word[i] != word[i].toUpperCase()) {
        isAllUpper = false;
      }
      if (word[i] != word[i].toLowerCase()) {
        isAllLower = false;
      }
    }

    if (isAllUpper || isAllLower) return true;

    // check first letter capital only
    if (word[0] == word[0].toUpperCase()) {
      for (int i = 1; i < n; i++) {
        if (word[i] != word[i].toLowerCase()) {
          return false;
        }
      }
      return true;
    }

    return false;
  }
}