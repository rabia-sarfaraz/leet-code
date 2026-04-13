class Solution {
  int bitwiseComplement(int n) {
    if (n == 0) return 1;

    int bits = 0;
    int temp = n;

    // find number of bits
    while (temp > 0) {
      bits++;
      temp >>= 1;
    }

    // create mask of 1s
    int mask = (1 << bits) - 1;

    // XOR gives complement
    return mask ^ n;
  }
}