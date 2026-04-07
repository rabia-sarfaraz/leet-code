class Solution {
  String findLongestWord(String s, List<String> dictionary) {
    
    bool isSubsequence(String a, String b) {
      int i = 0, j = 0;
      while (i < a.length && j < b.length) {
        if (a[i] == b[j]) i++;
        j++;
      }
      return i == a.length;
    }

    dictionary.sort((a, b) {
      if (a.length != b.length) {
        return b.length.compareTo(a.length);
      }
      return a.compareTo(b);
    });

    for (String word in dictionary) {
      if (isSubsequence(word, s)) {
        return word;
      }
    }

    return "";
  }
}