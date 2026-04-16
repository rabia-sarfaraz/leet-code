class Solution {
  int maxRepOpt1(String text) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < text.length; i++) {
      freq[text.codeUnitAt(i) - 97]++;
    }

    int result = 0;

    for (int c = 0; c < 26; c++) {
      if (freq[c] == 0) continue;

      int left = 0;
      int bad = 0;

      for (int right = 0; right < text.length; right++) {
        if (text.codeUnitAt(right) - 97 != c) {
          bad++;
        }

        while (bad > 1) {
          if (text.codeUnitAt(left) - 97 != c) {
            bad--;
          }
          left++;
        }

        int windowSize = right - left + 1;

        // manual max/min (no Math needed)
        if (windowSize > freq[c]) {
          result = result > freq[c] ? result : freq[c];
        } else {
          result = result > windowSize ? result : windowSize;
        }
      }
    }

    return result;
  }
}