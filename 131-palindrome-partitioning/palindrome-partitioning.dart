class Solution {
  List<List<String>> partition(String s) {
    List<List<String>> res = [];
    _backtrack(s, 0, [], res);
    return res;
  }

  void _backtrack(
      String s, int start, List<String> path, List<List<String>> res) {
    if (start == s.length) {
      res.add(List.from(path));
      return;
    }

    for (int end = start; end < s.length; end++) {
      if (_isPalindrome(s, start, end)) {
        path.add(s.substring(start, end + 1));
        _backtrack(s, end + 1, path, res);
        path.removeLast();
      }
    }
  }

  bool _isPalindrome(String s, int l, int r) {
    while (l < r) {
      if (s[l] != s[r]) return false;
      l++;
      r--;
    }
    return true;
  }
}