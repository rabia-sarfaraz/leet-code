class Solution {
  bool xorGame(List<int> nums) {
    int x = 0;

    for (int num in nums) {
      x ^= num;
    }

    // Alice wins if XOR is 0 OR even length
    return x == 0 || nums.length % 2 == 0;
  }
}