class Solution {
  int minimumPushes(String word) {
    List<int> freq = List.filled(26, 0);

    for (int i = 0; i < word.length; i++) {
      freq[word.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
    }

    freq.sort((a, b) => b.compareTo(a));

    int ans = 0;

    for (int i = 0; i < 26; i++) {
      if (freq[i] == 0) break;
      ans += freq[i] * ((i ~/ 8) + 1);
    }

    return ans;
  }
}