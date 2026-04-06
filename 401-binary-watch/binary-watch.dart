class Solution {
  List<String> readBinaryWatch(int turnedOn) {
    List<String> result = [];

    for (int h = 0; h < 12; h++) {
      for (int m = 0; m < 60; m++) {
        if (_countBits(h) + _countBits(m) == turnedOn) {
          String time = "$h:${m.toString().padLeft(2, '0')}";
          result.add(time);
        }
      }
    }

    return result;
  }

  int _countBits(int n) {
    int count = 0;
    while (n > 0) {
      count += n & 1;
      n >>= 1;
    }
    return count;
  }
}