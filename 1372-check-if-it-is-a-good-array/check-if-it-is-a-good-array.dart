class Solution {
  bool isGoodArray(List<int> nums) {
    int g = nums[0];

    for (int i = 1; i < nums.length; i++) {
      g = _gcd(g, nums[i]);
    }

    return g == 1;
  }

  int _gcd(int a, int b) {
    while (b != 0) {
      int temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }
}