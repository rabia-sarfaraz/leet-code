class Solution {
  int gcdOfOddEvenSums(int n) {
    int sumOdd = n * n;
    int sumEven = n * (n + 1);

    int gcd(int a, int b) {
      while (b != 0) {
        int t = a % b;
        a = b;
        b = t;
      }
      return a;
    }

    return gcd(sumOdd, sumEven);
  }
}