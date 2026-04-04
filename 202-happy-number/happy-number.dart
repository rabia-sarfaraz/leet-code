class Solution {
  bool isHappy(int n) {
    Set<int> seen = {};

    while (n != 1 && !seen.contains(n)) {
      seen.add(n);
      n = _getNext(n);
    }

    return n == 1;
  }

  int _getNext(int n) {
    int sum = 0;

    while (n > 0) {
      int digit = n % 10;
      sum += digit * digit;
      n ~/= 10;
    }

    return sum;
  }
}