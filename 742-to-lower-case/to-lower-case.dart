class Solution {
  String toLowerCase(String s) {
    List<int> res = [];

    for (int i = 0; i < s.length; i++) {
      int c = s.codeUnitAt(i);

      if (c >= 65 && c <= 90) {
        res.add(c + 32);
      } else {
        res.add(c);
      }
    }

    return String.fromCharCodes(res);
  }
}