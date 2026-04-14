class Solution {
  String gcdOfStrings(String str1, String str2) {
    // Step 1: check if concatenation matches
    if (str1 + str2 != str2 + str1) {
      return "";
    }

    // Step 2: compute gcd of lengths
    int gcd(int a, int b) {
      while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
      }
      return a;
    }

    int len = gcd(str1.length, str2.length);

    // Step 3: return prefix
    return str1.substring(0, len);
  }
}