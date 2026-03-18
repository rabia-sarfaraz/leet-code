class Solution {
  bool isPalindrome(int x) {
    // Negative numbers are not palindrome
    if (x < 0) return false;

    int original = x;
    int rev = 0;

    while (x != 0) {
      int digit = x % 10;
      x ~/= 10;

      rev = rev * 10 + digit;
    }

    return original == rev;
  }
}