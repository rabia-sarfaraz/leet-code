import 'dart:math';

class Solution {
  List<int> original = [];
  List<int> array = [];
  Random rand = Random();

  Solution(List<int> nums) {
    original = List.from(nums);
    array = List.from(nums);
  }

  List<int> reset() {
    array = List.from(original);
    return array;
  }

  List<int> shuffle() {
    for (int i = 0; i < array.length; i++) {
      int j = i + rand.nextInt(array.length - i);

      int temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
    return array;
  }
}