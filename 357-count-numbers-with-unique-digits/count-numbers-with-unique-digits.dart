class Solution {
  int countNumbersWithUniqueDigits(int n) {
    if (n == 0) return 1;

    int result = 10; // for n = 1
    int unique = 9;   // first digit choices
    int available = 9;

    for (int i = 2; i <= n && available > 0; i++) {
      unique *= available;
      result += unique;
      available--;
    }

    return result;
  }
}