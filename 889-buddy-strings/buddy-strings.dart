class Solution {
  bool buddyStrings(String s, String goal) {
    if (s.length != goal.length) return false;

    if (s == goal) {
      Set<String> set = s.split('').toSet();
      return set.length < s.length; // duplicate exists
    }

    List<int> diff = [];

    for (int i = 0; i < s.length; i++) {
      if (s[i] != goal[i]) {
        diff.add(i);
      }
    }

    if (diff.length != 2) return false;

    int i = diff[0], j = diff[1];

    return s[i] == goal[j] && s[j] == goal[i];
  }
}