class RangeModule {
  List<List<int>> ranges = [];

  RangeModule();

  void addRange(int left, int right) {
    List<List<int>> newRanges = [];
    int i = 0;

    // add all non-overlapping left
    while (i < ranges.length && ranges[i][1] < left) {
      newRanges.add(ranges[i]);
      i++;
    }

    // merge overlaps
    while (i < ranges.length && ranges[i][0] <= right) {
      left = left < ranges[i][0] ? left : ranges[i][0];
      right = right > ranges[i][1] ? right : ranges[i][1];
      i++;
    }

    newRanges.add([left, right]);

    // add remaining
    while (i < ranges.length) {
      newRanges.add(ranges[i]);
      i++;
    }

    ranges = newRanges;
  }

  bool queryRange(int left, int right) {
    for (var r in ranges) {
      if (r[0] <= left && right <= r[1]) {
        return true;
      }
      if (r[0] > left) break;
    }
    return false;
  }

  void removeRange(int left, int right) {
    List<List<int>> newRanges = [];

    for (var r in ranges) {
      if (r[1] <= left || r[0] >= right) {
        newRanges.add(r);
      } else {
        if (r[0] < left) {
          newRanges.add([r[0], left]);
        }
        if (r[1] > right) {
          newRanges.add([right, r[1]]);
        }
      }
    }

    ranges = newRanges;
  }
}