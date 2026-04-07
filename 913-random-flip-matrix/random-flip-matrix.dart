import 'dart:math';

class Solution {
  late int m;
  late int n;
  late int total;

  Random rand = Random();
  Map<int, int> map = {};

  Solution(int m, int n) {
    this.m = m;
    this.n = n;
    total = m * n;
  }

  List<int> flip() {
    int r = rand.nextInt(total);
    total--;

    int x = map.containsKey(r) ? map[r]! : r;

    map[r] = map.containsKey(total) ? map[total]! : total;

    return [x ~/ n, x % n];
  }

  void reset() {
    total = m * n;
    map.clear();
  }
}