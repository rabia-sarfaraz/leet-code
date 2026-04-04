class Solution {
  bool wordPattern(String pattern, String s) {
    List<String> words = s.split(' ');

    if (pattern.length != words.length) return false;

    Map<String, String> charToWord = {};
    Map<String, String> wordToChar = {};

    for (int i = 0; i < pattern.length; i++) {
      String ch = pattern[i];
      String word = words[i];

      if (charToWord.containsKey(ch)) {
        if (charToWord[ch] != word) return false;
      } else {
        charToWord[ch] = word;
      }

      if (wordToChar.containsKey(word)) {
        if (wordToChar[word] != ch) return false;
      } else {
        wordToChar[word] = ch;
      }
    }

    return true;
  }
}