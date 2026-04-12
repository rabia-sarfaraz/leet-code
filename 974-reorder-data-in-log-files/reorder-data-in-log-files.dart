class Solution {
  List<String> reorderLogFiles(List<String> logs) {
    List<String> letters = [];
    List<String> digits = [];

    for (String log in logs) {
      List<String> parts = log.split(' ');
      if (_isDigit(parts[1])) {
        digits.add(log);
      } else {
        letters.add(log);
      }
    }

    letters.sort((a, b) {
      List<String> aParts = a.split(' ');
      List<String> bParts = b.split(' ');

      String aId = aParts[0];
      String bId = bParts[0];

      String aContent = aParts.sublist(1).join(' ');
      String bContent = bParts.sublist(1).join(' ');

      int cmp = aContent.compareTo(bContent);
      if (cmp != 0) return cmp;

      return aId.compareTo(bId);
    });

    return [...letters, ...digits];
  }

  bool _isDigit(String s) {
    return s.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
           s.codeUnitAt(0) <= '9'.codeUnitAt(0);
  }
}