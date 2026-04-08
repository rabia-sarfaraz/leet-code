import 'dart:collection';

class Solution {
  String predictPartyVictory(String senate) {
    int n = senate.length;

    Queue<int> r = Queue();
    Queue<int> d = Queue();

    for (int i = 0; i < n; i++) {
      if (senate[i] == 'R') {
        r.add(i);
      } else {
        d.add(i);
      }
    }

    while (r.isNotEmpty && d.isNotEmpty) {
      int rIndex = r.removeFirst();
      int dIndex = d.removeFirst();

      if (rIndex < dIndex) {
        r.add(rIndex + n);
      } else {
        d.add(dIndex + n);
      }
    }

    return r.isNotEmpty ? "Radiant" : "Dire";
  }
}