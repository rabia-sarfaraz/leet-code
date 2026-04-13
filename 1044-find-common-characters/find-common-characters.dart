class Solution {
  List<String> commonChars(List<String> words) {
    List<int> minFreq = List.filled(26, 0);

    // Step 1: Initialize with first word
    for (var ch in words[0].split('')) {
      minFreq[ch.codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
    }

    // Step 2: Process remaining words
    for (int i = 1; i < words.length; i++) {
      List<int> freq = List.filled(26, 0);

      for (var ch in words[i].split('')) {
        freq[ch.codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
      }

      // Take minimum frequency
      for (int j = 0; j < 26; j++) {
        minFreq[j] = minFreq[j] < freq[j] ? minFreq[j] : freq[j];
      }
    }

    // Step 3: Build result
    List<String> result = [];
    for (int i = 0; i < 26; i++) {
      while (minFreq[i] > 0) {
        result.add(String.fromCharCode(i + 'a'.codeUnitAt(0)));
        minFreq[i]--;
      }
    }

    return result;
  }
}