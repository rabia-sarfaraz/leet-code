class Solution {
  int uniqueXorTriplets(List<int> nums) {
    int n = nums.length;

    if (n < 3) return n;

    int ans = 1;
    while (ans <= n) {
      ans <<= 1;
    }
    return ans;
  }
}