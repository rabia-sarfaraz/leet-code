class Solution {
  int countSubstrings(String s) {
    int n = s.length;
    int count = 0;

    void expand(int l, int r) {
      while (l >= 0 && r < n && s[l] == s[r]) {
        count++;
        l--;
        r++;
      }
    }

    for (int i = 0; i < n; i++) {
      expand(i, i);     // odd length
      expand(i, i + 1); // even length
    }

    return count;
  }
}