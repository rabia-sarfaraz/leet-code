class Solution {
  int lengthLongestPath(String input) {
    List<int> stack = List.filled(1000, 0);
    int maxLen = 0;

    List<String> parts = input.split('\n');

    for (String part in parts) {
      int level = part.lastIndexOf('\t') + 1;
      String name = part.substring(level);

      int currLen = stack[level] + name.length;

      if (name.contains('.')) {
        maxLen = maxLen > currLen ? maxLen : currLen;
      } else {
        stack[level + 1] = currLen + 1; // +1 for '/'
      }
    }

    return maxLen;
  }
}