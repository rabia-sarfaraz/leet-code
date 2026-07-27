import 'dart:collection';
import 'package:collection/collection.dart';

class Solution {
  List<int> busiestServers(int k, List<int> arrival, List<int> load) {
    SplayTreeSet<int> available = SplayTreeSet<int>();
    for (int i = 0; i < k; i++) {
      available.add(i);
    }

    HeapPriorityQueue<List<int>> busy = HeapPriorityQueue<List<int>>(
      (a, b) => a[0] == b[0] ? a[1] - b[1] : a[0] - b[0],
    );

    List<int> count = List.filled(k, 0);

    for (int i = 0; i < arrival.length; i++) {
      while (busy.isNotEmpty && busy.first[0] <= arrival[i]) {
        available.add(busy.removeFirst()[1]);
      }

      if (available.isEmpty) continue;

      int start = i % k;

      int? server = available.lookup(start);
      if (server == null) {
        var it = available.firstWhere(
          (x) => x >= start,
          orElse: () => -1,
        );
        server = it == -1 ? available.first : it;
      }

      available.remove(server);
      count[server]++;
      busy.add([arrival[i] + load[i], server]);
    }

    int mx = count.reduce((a, b) => a > b ? a : b);

    List<int> ans = [];
    for (int i = 0; i < k; i++) {
      if (count[i] == mx) ans.add(i);
    }

    return ans;
  }
}