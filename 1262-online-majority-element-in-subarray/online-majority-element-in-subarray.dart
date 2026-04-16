import 'dart:math';

class MajorityChecker {
  late List<int> arr;
  late Map<int, List<int>> pos;
  Random rand = Random();

  MajorityChecker(List<int> arr) {
    this.arr = arr;
    pos = {};

    for (int i = 0; i < arr.length; i++) {
      pos.putIfAbsent(arr[i], () => []);
      pos[arr[i]]!.add(i);
    }
  }

  int _countOccurrences(List<int> list, int l, int r) {
    int left = _lowerBound(list, l);
    int right = _upperBound(list, r);
    return right - left;
  }

  int _lowerBound(List<int> list, int target) {
    int l = 0, r = list.length;
    while (l < r) {
      int m = (l + r) ~/ 2;
      if (list[m] >= target) {
        r = m;
      } else {
        l = m + 1;
      }
    }
    return l;
  }

  int _upperBound(List<int> list, int target) {
    int l = 0, r = list.length;
    while (l < r) {
      int m = (l + r) ~/ 2;
      if (list[m] > target) {
        r = m;
      } else {
        l = m + 1;
      }
    }
    return l;
  }

  int query(int left, int right, int threshold) {
    // try random sampling
    for (int i = 0; i < 20; i++) {
      int idx = left + rand.nextInt(right - left + 1);
      int val = arr[idx];

      List<int> p = pos[val]!;
      int cnt = _countOccurrences(p, left, right);

      if (cnt >= threshold) return val;
    }

    return -1;
  }
}