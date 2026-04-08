class MyCalendar {
  List<List<int>> bookings = [];

  MyCalendar();

  bool book(int startTime, int endTime) {
    for (var b in bookings) {
      int s = b[0];
      int e = b[1];

      // overlap check
      if (startTime < e && endTime > s) {
        return false;
      }
    }

    bookings.add([startTime, endTime]);
    return true;
  }
}