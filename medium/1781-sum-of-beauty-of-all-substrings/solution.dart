class Solution {
  int beautySum(String s) {
    int result = 0;

    for (int i = 0; i < s.length; i++) {
      List<int> freq = List.filled(26, 0);

      for (int j = i; j < s.length; j++) {
        int index = s.codeUnitAt(j) - 'a'.codeUnitAt(0);
        freq[index]++;

        int maxFreq = 0;
        int minFreq = 1000000;

        for (int k = 0; k < 26; k++) {
          if (freq[k] > 0) {
            maxFreq = maxFreq > freq[k] ? maxFreq : freq[k];
            minFreq = minFreq < freq[k] ? minFreq : freq[k];
          }
        }

        result += maxFreq - minFreq;
      }
    }

    return result;
  }
}