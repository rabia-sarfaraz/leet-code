class Solution {
  int maxLength(List<String> arr) {
    return _backtrack(arr, 0, "");
  }

  int _backtrack(List<String> arr, int index, String current) {
    if (!_isUnique(current)) return 0;

    int maxLen = current.length;

    for (int i = index; i < arr.length; i++) {
      maxLen = maxLen > _backtrack(arr, i + 1, current + arr[i])
          ? maxLen
          : _backtrack(arr, i + 1, current + arr[i]);
    }

    return maxLen;
  }

  bool _isUnique(String s) {
    Set<String> seen = {};
    for (int i = 0; i < s.length; i++) {
      if (seen.contains(s[i])) return false;
      seen.add(s[i]);
    }
    return true;
  }
}