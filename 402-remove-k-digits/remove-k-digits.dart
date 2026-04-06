class Solution {
  String removeKdigits(String num, int k) {
    List<int> stack = [];

    for (int i = 0; i < num.length; i++) {
      int digit = num.codeUnitAt(i) - '0'.codeUnitAt(0);

      while (k > 0 && stack.isNotEmpty && stack.last > digit) {
        stack.removeLast();
        k--;
      }

      stack.add(digit);
    }

    // If k still left, remove from end
    while (k > 0 && stack.isNotEmpty) {
      stack.removeLast();
      k--;
    }

    // Build result
    StringBuffer sb = StringBuffer();
    for (int d in stack) {
      if (!(sb.isEmpty && d == 0)) {
        sb.write(d);
      }
    }

    String result = sb.toString();
    return result.isEmpty ? "0" : result;
  }
}