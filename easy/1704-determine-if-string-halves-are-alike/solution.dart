class Solution {
  bool halvesAreAlike(String s) {
    int mid = s.length ~/ 2;
    int count1 = 0;
    int count2 = 0;

    String vowels = "aeiouAEIOU";

    for (int i = 0; i < mid; i++) {
      if (vowels.contains(s[i])) {
        count1++;
      }
    }

    for (int i = mid; i < s.length; i++) {
      if (vowels.contains(s[i])) {
        count2++;
      }
    }

    return count1 == count2;
  }
}