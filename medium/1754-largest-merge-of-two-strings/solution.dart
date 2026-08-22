class Solution {
  String largestMerge(String word1, String word2) {
    int i = 0;
    int j = 0;
    StringBuffer ans = StringBuffer();

    while (i < word1.length && j < word2.length) {
      // Remaining strings compare karo
      if (word1.substring(i).compareTo(word2.substring(j)) >= 0) {
        ans.write(word1[i]);
        i++;
      } else {
        ans.write(word2[j]);
        j++;
      }
    }

    // Remaining characters
    if (i < word1.length) {
      ans.write(word1.substring(i));
    }

    if (j < word2.length) {
      ans.write(word2.substring(j));
    }

    return ans.toString();
  }
}