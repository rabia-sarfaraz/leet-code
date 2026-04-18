class Solution {
  int findNumbers(List<int> nums) {
    int count = 0;

    for (int num in nums) {
      if (num.toString().length % 2 == 0) {
        count++;
      }
    }

    return count;
  }
}