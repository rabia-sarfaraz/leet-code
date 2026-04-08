import 'package:collection/collection.dart';

class Solution {
  int scheduleCourse(List<List<int>> courses) {
    courses.sort((a, b) => a[1].compareTo(b[1]));

    PriorityQueue<int> maxHeap =
        PriorityQueue<int>((a, b) => b.compareTo(a));

    int totalTime = 0;

    for (var course in courses) {
      int duration = course[0];
      int lastDay = course[1];

      totalTime += duration;
      maxHeap.add(duration);

      if (totalTime > lastDay) {
        totalTime -= maxHeap.removeFirst() as int;
      }
    }

    return maxHeap.length;
  }
}