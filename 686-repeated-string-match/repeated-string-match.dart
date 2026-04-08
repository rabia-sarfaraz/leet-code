class Solution {
  int repeatedStringMatch(String a, String b) {
    String temp = "";
    int count = 0;

    // Repeat until length >= b
    while (temp.length < b.length) {
      temp += a;
      count++;
    }

    // check once
    if (temp.contains(b)) return count;

    // check one more repetition (for overlap cases)
    temp += a;
    count++;
    if (temp.contains(b)) return count;

    return -1;
  }
}