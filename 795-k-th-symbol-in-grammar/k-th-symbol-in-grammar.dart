class Solution {
  int kthGrammar(int n, int k) {
    int x = k - 1;
    int count = 0;

    while (x > 0) {
      count += x & 1;
      x >>= 1;
    }

    return count % 2;
  }
}