class Solution {
  int maxCoins(List<int> piles) {
    piles.sort();

    int ans = 0;
    int left = 0;
    int right = piles.length - 2;

    while (left < right) {
      ans += piles[right];
      left++;
      right -= 2;
    }

    return ans;
  }
}