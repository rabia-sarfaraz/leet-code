class Solution {
  int findSubstringInWraproundString(String s) {
    List<int> dp = List.filled(26, 0);

    int curLen = 0;

    for (int i = 0; i < s.length; i++) {
      if (i > 0 &&
          ((s.codeUnitAt(i) - s.codeUnitAt(i - 1)) % 26 == 1)) {
        curLen++;
      } else {
        curLen = 1;
      }

      int idx = s.codeUnitAt(i) - 97;
      dp[idx] = dp[idx] > curLen ? dp[idx] : curLen;
    }

    int result = 0;
    for (int v in dp) {
      result += v;
    }

    return result;
  }
}