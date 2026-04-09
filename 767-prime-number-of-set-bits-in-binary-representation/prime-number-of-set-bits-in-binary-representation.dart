class Solution {
  int countPrimeSetBits(int left, int right) {
    Set<int> primes = {2, 3, 5, 7, 11, 13, 17, 19};

    int countBits(int n) {
      int count = 0;
      while (n > 0) {
        count += (n & 1);
        n >>= 1;
      }
      return count;
    }

    int result = 0;

    for (int i = left; i <= right; i++) {
      int bits = countBits(i);
      if (primes.contains(bits)) {
        result++;
      }
    }

    return result;
  }
}