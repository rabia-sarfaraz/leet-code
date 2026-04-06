import 'dart:math';

class RandomizedSet {
  List<int> nums = [];
  Map<int, int> map = {};
  Random rand = Random();

  RandomizedSet();

  bool insert(int val) {
    if (map.containsKey(val)) return false;

    nums.add(val);
    map[val] = nums.length - 1;
    return true;
  }

  bool remove(int val) {
    if (!map.containsKey(val)) return false;

    int index = map[val]!;
    int lastVal = nums.last;

    // swap with last element
    nums[index] = lastVal;
    map[lastVal] = index;

    // remove last
    nums.removeLast();
    map.remove(val);

    return true;
  }

  int getRandom() {
    int index = rand.nextInt(nums.length);
    return nums[index];
  }
}