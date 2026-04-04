class Solution {
  int rangeBitwiseAnd(int left, int right) {
    int shift = 0;

    // Find common prefix
    while (left < right) {
      left >>= 1;
      right >>= 1;
      shift++;
    }

    // Shift back to original position
    return left << shift;
  }
}