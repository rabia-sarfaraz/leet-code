class Solution {
  int minFlipsMonoIncr(String s) {
    int ones = 0;
    int flips = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '1') {
        ones++;
      } else {
        flips = (flips + 1 < ones) ? flips + 1 : ones;
      }
    }

    return flips;
  }
}