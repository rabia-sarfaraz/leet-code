class Solution {
  String convertToTitle(int columnNumber) {
    String result = "";

    while (columnNumber > 0) {
      columnNumber--; // important step to make it 0-based
      int remainder = columnNumber % 26;
      result = String.fromCharCode(65 + remainder) + result;
      columnNumber ~/= 26;
    }

    return result;
  }
}