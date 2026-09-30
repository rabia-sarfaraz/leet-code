class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1 || numRows >= s.length) {
      return s;
    }

    List<StringBuffer> rows =
        List.generate(numRows, (_) => StringBuffer());

    int row = 0;
    int direction = 1;

    for (int i = 0; i < s.length; i++) {
      rows[row].write(s[i]);

      if (row == 0) {
        direction = 1;
      } else if (row == numRows - 1) {
        direction = -1;
      }

      row += direction;
    }

    StringBuffer result = StringBuffer();

    for (final r in rows) {
      result.write(r.toString());
    }

    return result.toString();
  }
}