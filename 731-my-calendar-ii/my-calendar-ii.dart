class MyCalendarTwo {
  List<List<int>> booked = [];
  List<List<int>> overlaps = [];

  MyCalendarTwo();

  bool book(int startTime, int endTime) {
    
    // Step 1: check triple booking risk
    for (var o in overlaps) {
      int s = o[0], e = o[1];

      if (startTime < e && endTime > s) {
        return false; // triple overlap
      }
    }

    // Step 2: update overlaps with existing bookings
    for (var b in booked) {
      int s = b[0], e = b[1];

      int overlapStart = startTime > s ? startTime : s;
      int overlapEnd = endTime < e ? endTime : e;

      if (overlapStart < overlapEnd) {
        overlaps.add([overlapStart, overlapEnd]);
      }
    }

    // Step 3: add booking
    booked.add([startTime, endTime]);

    return true;
  }
}