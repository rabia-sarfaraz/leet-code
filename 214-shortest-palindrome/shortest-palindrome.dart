class Solution {
  String shortestPalindrome(String s) {
    if (s.isEmpty) return s;

    String rev = s.split('').reversed.join();
    String temp = s + "#" + rev;

    List<int> lps = List.filled(temp.length, 0);

    for (int i = 1; i < temp.length; i++) {
      int j = lps[i - 1];

      while (j > 0 && temp[i] != temp[j]) {
        j = lps[j - 1];
      }

      if (temp[i] == temp[j]) {
        j++;
      }

      lps[i] = j;
    }

    int longestPrefix = lps.last;

    String suffix = s.substring(longestPrefix);
    String add = suffix.split('').reversed.join();

    return add + s;
  }
}