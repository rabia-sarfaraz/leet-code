import 'dart:collection';
import 'package:collection/collection.dart';

class Solution {
  int minRefuelStops(int target, int startFuel, List<List<int>> stations) {
    // max heap (fuel)
    HeapPriorityQueue<int> pq =
        HeapPriorityQueue<int>((a, b) => b.compareTo(a));

    int fuel = startFuel;
    int i = 0;
    int n = stations.length;
    int stops = 0;

    while (fuel < target) {
      // add all reachable stations
      while (i < n && stations[i][0] <= fuel) {
        pq.add(stations[i][1]);
        i++;
      }

      // if no fuel available
      if (pq.isEmpty) return -1;

      fuel += pq.removeFirst();
      stops++;
    }

    return stops;
  }
}