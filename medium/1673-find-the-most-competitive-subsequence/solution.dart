class Solution {
  List<int> mostCompetitive(List<int> nums, int k) {
    List<int> stack = [];
    int remove = nums.length - k;

    for (int num in nums) {
      while (stack.isNotEmpty &&
          stack.last > num &&
          remove > 0) {
        stack.removeLast();
        remove--;
      }

      stack.add(num);
    }

    return stack.sublist(0, k);
  }
}