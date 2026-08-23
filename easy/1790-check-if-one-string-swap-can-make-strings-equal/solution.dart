class Solution {
  bool areAlmostEqual(String s1, String s2) {
    List<int> diff = [];

    for (int i = 0; i < s1.length; i++) {
      if (s1[i] != s2[i]) {
        diff.add(i);
      }
    }

    // Already equal
    if (diff.isEmpty) {
      return true;
    }

    // More than one swap needed
    if (diff.length != 2) {
      return false;
    }

    int a = diff[0];
    int b = diff[1];

    // Check if swapping makes them equal
    return s1[a] == s2[b] && s1[b] == s2[a];
  }
}