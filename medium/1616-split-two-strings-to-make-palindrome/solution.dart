class Solution {
  bool checkPalindromeFormation(String a, String b) {
    return check(a, b) || check(b, a);
  }

  bool check(String a, String b) {
    int i = 0;
    int j = a.length - 1;

    while (i < j && a[i] == b[j]) {
      i++;
      j--;
    }

    return isPalindrome(a, i, j) || isPalindrome(b, i, j);
  }

  bool isPalindrome(String s, int left, int right) {
    while (left < right) {
      if (s[left] != s[right]) return false;
      left++;
      right--;
    }
    return true;
  }
}