import 'dart:math';

class Solution {
  late int bound;
  late Map<int, int> map;
  late Random rand;

  Solution(int n, List<int> blacklist) {
    rand = Random();
    map = {};

    bound = n - blacklist.length;

    Set<int> black = blacklist.toSet();

    int last = n - 1;

    for (int b in blacklist) {
      if (b < bound) {
        while (black.contains(last)) {
          last--;
        }
        map[b] = last;
        last--;
      }
    }
  }

  int pick() {
    int x = rand.nextInt(bound);
    return map.containsKey(x) ? map[x]! : x;
  }
}