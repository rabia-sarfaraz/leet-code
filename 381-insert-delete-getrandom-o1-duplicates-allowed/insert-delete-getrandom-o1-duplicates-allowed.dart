import 'dart:math';

class RandomizedCollection {
  List<int> nums = [];
  Map<int, Set<int>> idxMap = {};
  Random rand = Random();

  RandomizedCollection();

  bool insert(int val) {
    bool notPresent = !idxMap.containsKey(val);

    idxMap.putIfAbsent(val, () => <int>{});
    idxMap[val]!.add(nums.length);

    nums.add(val);

    return notPresent;
  }

  bool remove(int val) {
    if (!idxMap.containsKey(val) || idxMap[val]!.isEmpty) {
      return false;
    }

    int removeIdx = idxMap[val]!.first;
    idxMap[val]!.remove(removeIdx);

    int lastVal = nums.last;
    int lastIdx = nums.length - 1;

    nums[removeIdx] = lastVal;

    idxMap[lastVal]!.add(removeIdx);
    idxMap[lastVal]!.remove(lastIdx);

    nums.removeLast();

    if (idxMap[val]!.isEmpty) {
      idxMap.remove(val);
    }

    return true;
  }

  int getRandom() {
    return nums[rand.nextInt(nums.length)];
  }
}