class Solution {
  int countDigitOne(int n) {
    int count = 0;
    int factor = 1;

    while (factor <= n) {
      int high = n ~/ (factor * 10);
      int cur = (n ~/ factor) % 10;
      int low = n % factor;

      if (cur == 0) {
        count += high * factor;
      } else if (cur == 1) {
        count += high * factor + low + 1;
      } else {
        count += (high + 1) * factor;
      }

      factor *= 10;
    }

    return count;
  }
}