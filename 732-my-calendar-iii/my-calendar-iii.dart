import 'dart:collection';

class MyCalendarThree {
  SplayTreeMap<int, int> timeline = SplayTreeMap();

  MyCalendarThree();

  int book(int startTime, int endTime) {
    timeline[startTime] = (timeline[startTime] ?? 0) + 1;
    timeline[endTime] = (timeline[endTime] ?? 0) - 1;

    int active = 0;
    int maxOverlap = 0;

    for (int delta in timeline.values) {
      active += delta;
      if (active > maxOverlap) {
        maxOverlap = active;
      }
    }

    return maxOverlap;
  }
}