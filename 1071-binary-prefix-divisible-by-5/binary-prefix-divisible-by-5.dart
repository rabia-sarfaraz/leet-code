class Solution {
  List<bool> prefixesDivBy5(List<int> nums) {
    List<bool> res = [];
    int rem = 0;

    for (int bit in nums) {
      rem = ((rem << 1) + bit) % 5;
      res.add(rem == 0);
    }

    return res;
  }
}