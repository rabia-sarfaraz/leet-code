class Solution {
  String convert(String s, int numRows) {
    // Edge case
    if (numRows == 1 || s.length <= numRows) {
      return s;
    }

    // Create rows
    List<StringBuffer> rows =
        List.generate(numRows, (_) => StringBuffer());

    int currentRow = 0;
    bool goingDown = false;

    // Fill rows
    for (int i = 0; i < s.length; i++) {
      rows[currentRow].write(s[i]);

      // Change direction
      if (currentRow == 0 || currentRow == numRows - 1) {
        goingDown = !goingDown;
      }

      currentRow += goingDown ? 1 : -1;
    }

    // Combine result
    StringBuffer result = StringBuffer();
    for (var row in rows) {
      result.write(row.toString());
    }

    return result.toString();
  }
}