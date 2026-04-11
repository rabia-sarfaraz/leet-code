class Solution {
  int primePalindrome(int n) {
    if (n <= 2) return 2;
    if (n <= 3) return 3;
    if (n <= 5) return 5;
    if (n <= 7) return 7;
    if (n <= 11) return 11;

    for (int len = 1; len < 6; len++) {
      int start = pow10(len - 1);
      int end = pow10(len);

      for (int i = start; i < end; i++) {
        String s = i.toString();
        String rev = s.split('').reversed.join();

        // odd length palindrome
        String palStr = s + rev.substring(1);
        int pal = int.parse(palStr);

        if (pal >= n && isPrime(pal)) {
          return pal;
        }
      }
    }

    return -1;
  }

  int pow10(int x) {
    int res = 1;
    for (int i = 0; i < x; i++) {
      res *= 10;
    }
    return res;
  }

  bool isPrime(int x) {
    if (x < 2) return false;
    if (x % 2 == 0) return x == 2;

    for (int i = 3; i * i <= x; i += 2) {
      if (x % i == 0) return false;
    }
    return true;
  }
}