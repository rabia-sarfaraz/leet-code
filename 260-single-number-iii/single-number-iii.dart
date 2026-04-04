class Solution {
  List<int> singleNumber(List<int> nums) {
    int xor = 0;

    // Step 1: XOR of all elements
    for (int num in nums) {
      xor ^= num;
    }

    // Step 2: Rightmost set bit
    int diff = xor & (-xor);

    int a = 0, b = 0;

    // Step 3: Divide into two groups
    for (int num in nums) {
      if ((num & diff) == 0) {
        a ^= num;
      } else {
        b ^= num;
      }
    }

    return [a, b];
  }
}