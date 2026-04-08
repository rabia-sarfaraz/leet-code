import 'package:collection/collection.dart';

class Solution {
  List<int> smallestRange(List<List<int>> nums) {
    int k = nums.length;

    // Min Heap: [value, listIndex, elementIndex]
    PriorityQueue<List<int>> minHeap = PriorityQueue(
        (a, b) => a[0].compareTo(b[0]));

    int currentMax = -100000;

    // initialize heap
    for (int i = 0; i < k; i++) {
      int val = nums[i][0];
      minHeap.add([val, i, 0]);
      if (val > currentMax) currentMax = val;
    }

    int rangeStart = 0, rangeEnd = 1000000;

    while (true) {
      var curr = minHeap.removeFirst();
      int minVal = curr[0];
      int listIndex = curr[1];
      int elemIndex = curr[2];

      // update best range
      if (currentMax - minVal < rangeEnd - rangeStart) {
        rangeStart = minVal;
        rangeEnd = currentMax;
      }

      // move pointer in that list
      if (elemIndex + 1 == nums[listIndex].length) break;

      int nextVal = nums[listIndex][elemIndex + 1];
      minHeap.add([nextVal, listIndex, elemIndex + 1]);

      if (nextVal > currentMax) currentMax = nextVal;
    }

    return [rangeStart, rangeEnd];
  }
}