class Solution {
  int findContentChildren(List<int> g, List<int> s) {
    g.sort();
    s.sort();

    int i = 0; // children
    int j = 0; // cookies
    int count = 0;

    while (i < g.length && j < s.length) {
      if (s[j] >= g[i]) {
        count++;
        i++;
        j++;
      } else {
        j++;
      }
    }

    return count;
  }
}