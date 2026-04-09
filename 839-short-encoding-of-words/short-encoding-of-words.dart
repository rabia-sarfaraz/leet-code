class Solution {
  int minimumLengthEncoding(List<String> words) {
    Set<String> set = words.toSet();

    for (String word in words) {
      for (int i = 1; i < word.length; i++) {
        set.remove(word.substring(i));
      }
    }

    int result = 0;

    for (String word in set) {
      result += word.length + 1; // +1 for '#'
    }

    return result;
  }
}