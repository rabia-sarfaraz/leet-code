class Solution {
  int maxDepth(String s) {
    int depth = 0;
    int maxDepth = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        depth++;
        if (depth > maxDepth) {
          maxDepth = depth;
        }
      } else if (s[i] == ')') {
        depth--;
      }
    }

    return maxDepth;
  }
}