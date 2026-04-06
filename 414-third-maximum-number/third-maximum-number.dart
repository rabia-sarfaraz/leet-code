class Solution {
  int thirdMax(List<int> nums) {
    int? first;
    int? second;
    int? third;

    for (int num in nums) {
      if (num == first || num == second || num == third) {
        continue; // skip duplicates
      }

      if (first == null || num > first) {
        third = second;
        second = first;
        first = num;
      } else if (second == null || num > second) {
        third = second;
        second = num;
      } else if (third == null || num > third) {
        third = num;
      }
    }

    return third ?? first!;
  }
}