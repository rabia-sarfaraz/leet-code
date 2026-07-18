class Solution {
  int findGCD(List<int> nums) {
    int mn = nums[0];
    int mx = nums[0];

    for (int x in nums) {
      if (x < mn) mn = x;
      if (x > mx) mx = x;
    }

    while (mx != 0) {
      int temp = mx;
      mx = mn % mx;
      mn = temp;
    }

    return mn;
  }
}