class Solution {
  int maxVowels(String s, int k) {
    Set<String> vowels = {'a', 'e', 'i', 'o', 'u'};

    int count = 0;

    for (int i = 0; i < k; i++) {
      if (vowels.contains(s[i])) {
        count++;
      }
    }

    int ans = count;

    for (int i = k; i < s.length; i++) {
      if (vowels.contains(s[i])) {
        count++;
      }

      if (vowels.contains(s[i - k])) {
        count--;
      }

      ans = ans > count ? ans : count;
    }

    return ans;
  }
}