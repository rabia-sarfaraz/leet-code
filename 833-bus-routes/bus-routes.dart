import 'dart:collection';
class Solution {
  int numBusesToDestination(
      List<List<int>> routes, int source, int target) {
    
    if (source == target) return 0;

    // stop -> buses map
    Map<int, List<int>> stopToBuses = {};

    for (int i = 0; i < routes.length; i++) {
      for (int stop in routes[i]) {
        stopToBuses.putIfAbsent(stop, () => []);
        stopToBuses[stop]!.add(i);
      }
    }

    Queue<int> queue = Queue();
    Set<int> visitedStops = {};
    Set<int> visitedBuses = {};

    queue.add(source);
    visitedStops.add(source);

    int buses = 0;

    while (queue.isNotEmpty) {
      int size = queue.length;
      buses++;

      for (int i = 0; i < size; i++) {
        int stop = queue.removeFirst();

        for (int bus in stopToBuses[stop] ?? []) {
          if (visitedBuses.contains(bus)) continue;

          visitedBuses.add(bus);

          for (int nextStop in routes[bus]) {
            if (nextStop == target) return buses;

            if (!visitedStops.contains(nextStop)) {
              visitedStops.add(nextStop);
              queue.add(nextStop);
            }
          }
        }
      }
    }

    return -1;
  }
}