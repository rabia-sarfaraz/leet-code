class Solution {
  int maxScoreWords(List<String> words, List<String> letters, List<int> score) {
    List<int> freq = List.filled(26, 0);

    for (String ch in letters) {
      freq[ch.codeUnitAt(0) - 97]++;
    }

    List<int> wordScore = List.filled(words.length, 0);
    List<List<int>> wordFreq =
        List.generate(words.length, (_) => List.filled(26, 0));

    for (int i = 0; i < words.length; i++) {
      for (int j = 0; j < words[i].length; j++) {
        int idx = words[i][j].codeUnitAt(0) - 97;
        wordFreq[i][idx]++;
        wordScore[i] += score[idx];
      }
    }

    return _backtrack(words, wordFreq, wordScore, freq, 0);
  }

  int _backtrack(List<String> words, List<List<int>> wordFreq,
      List<int> wordScore, List<int> freq, int index) {
    if (index == words.length) return 0;

    int skip = _backtrack(words, wordFreq, wordScore, freq, index + 1);

    bool canTake = true;

    for (int i = 0; i < 26; i++) {
      if (wordFreq[index][i] > freq[i]) {
        canTake = false;
        break;
      }
    }

    int take = 0;

    if (canTake) {
      for (int i = 0; i < 26; i++) {
        freq[i] -= wordFreq[index][i];
      }

      take = wordScore[index] +
          _backtrack(words, wordFreq, wordScore, freq, index + 1);

      for (int i = 0; i < 26; i++) {
        freq[i] += wordFreq[index][i];
      }
    }

    return take > skip ? take : skip;
  }
}