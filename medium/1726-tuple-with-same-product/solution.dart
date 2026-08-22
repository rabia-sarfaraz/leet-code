class Solution {
  int tupleSameProduct(List<int> nums) {
    Map<int, int> freq = {};
    int ans = 0;

    for (int i = 0; i < nums.length; i++) {
      for (int j = i + 1; j < nums.length; j++) {
        int product = nums[i] * nums[j];

        int count = freq[product] ?? 0;

        // Har 2 pairs same product dein to 8 tuples bante hain
        ans += count * 8;

        freq[product] = count + 1;
      }
    }

    return ans;
  }
}