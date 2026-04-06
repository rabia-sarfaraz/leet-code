class Solution {
  int characterReplacement(String s, int k) {
    List<int> freq = List.filled(26, 0);

    int left = 0;
    int maxFreq = 0;
    int result = 0;

    for (int right = 0; right < s.length; right++) {
      int idx = s.codeUnitAt(right) - 65;
      freq[idx]++;

      maxFreq = max(maxFreq, freq[idx]);

      while ((right - left + 1) - maxFreq > k) {
        freq[s.codeUnitAt(left) - 65]--;
        left++;
      }

      result = max(result, right - left + 1);
    }

    return result;
  }

  int max(int a, int b) => a > b ? a : b;
}