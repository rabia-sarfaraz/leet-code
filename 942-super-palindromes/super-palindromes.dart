class Solution {
  int superpalindromesInRange(String left, String right) {
    int L = int.parse(left);
    int R = int.parse(right);
    int count = 0;

    // generate palindromes
    for (int i = 1; i < 100000; i++) {
      String s = i.toString();
      String rev = s.split('').reversed.join('');

      // odd length palindrome
      int odd = int.parse(s + rev.substring(1));
      int square = odd * odd;
      if (square > R) break;
      if (square >= L && isPal(square)) count++;

      // even length palindrome
      int even = int.parse(s + rev);
      square = even * even;
      if (square >= L && square <= R && isPal(square)) {
        count++;
      }
    }

    return count;
  }

  bool isPal(int x) {
    String s = x.toString();
    return s == s.split('').reversed.join('');
  }
}