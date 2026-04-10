class Solution {
  String findReplaceString(String s, List<int> indices, List<String> sources, List<String> targets) {
    int n = s.length;

    // index → operation map
    Map<int, int> match = {};

    // Step 1: check matches on ORIGINAL string
    for (int i = 0; i < indices.length; i++) {
      int idx = indices[i];
      String src = sources[i];

      if (idx + src.length <= n &&
          s.substring(idx, idx + src.length) == src) {
        match[idx] = i;
      }
    }

    // Step 2: build result
    String result = "";
    int i = 0;

    while (i < n) {
      if (match.containsKey(i)) {
        int opIndex = match[i]!;
        result += targets[opIndex];
        i += sources[opIndex].length;
      } else {
        result += s[i];
        i++;
      }
    }

    return result;
  }
}