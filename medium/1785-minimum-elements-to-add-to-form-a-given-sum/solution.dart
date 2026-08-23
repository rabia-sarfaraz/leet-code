class Solution {
  int minElements(List<int> nums, int limit, int goal) {
    int sum = 0;

    for (int num in nums) {
      sum += num;
    }

    int diff = (goal - sum).abs();

    return (diff + limit - 1) ~/ limit;
  }
}