class Solution {
  List<int> smallerNumbersThanCurrent(List<int> nums) {
    List<int> sorted = List.from(nums);
    sorted.sort();

    Map<int, int> firstIndex = {};

    for (int i = 0; i < sorted.length; i++) {
      firstIndex.putIfAbsent(sorted[i], () => i);
    }

    return nums.map((num) => firstIndex[num]!).toList();
  }
}