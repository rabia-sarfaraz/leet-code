class Solution {
  bool sumGame(String num) {
    int n = num.length;
    int half = n ~/ 2;

    int sum = 0;
    int qDiff = 0;

    for (int i = 0; i < half; i++) {
      if (num[i] == '?') {
        qDiff++;
      } else {
        sum += int.parse(num[i]);
      }
    }

    for (int i = half; i < n; i++) {
      if (num[i] == '?') {
        qDiff--;
      } else {
        sum -= int.parse(num[i]);
      }
    }

    // Odd number of unmatched '?' => Alice wins
    if (qDiff.abs() % 2 == 1) {
      return true;
    }

    // No unmatched '?' 
    if (qDiff == 0) {
      return sum != 0;
    }

    // Bob can win only when the signed difference
    // exactly matches the required compensation.
    return sum != -(qDiff ~/ 2) * 9;
  }
}