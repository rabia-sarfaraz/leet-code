class Solution {
  int minOperations(List<String> logs) {
    int depth = 0;

    for (String log in logs) {
      if (log == "../") {
        if (depth > 0) depth--;
      } else if (log == "./") {
        continue;
      } else {
        depth++;
      }
    }

    return depth;
  }
}