class Solution {
  List<String> letterCasePermutation(String s) {
    List<String> result = [];

    void backtrack(int i, String path) {
      if (i == s.length) {
        result.add(path);
        return;
      }

      String ch = s[i];

      if (RegExp(r'[0-9]').hasMatch(ch)) {
        backtrack(i + 1, path + ch);
      } else {
        // lowercase
        backtrack(i + 1, path + ch.toLowerCase());

        // uppercase
        backtrack(i + 1, path + ch.toUpperCase());
      }
    }

    backtrack(0, "");
    return result;
  }
}