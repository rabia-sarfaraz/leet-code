import 'package:collection/collection.dart';

class Solution {
  int findMaximizedCapital(int k, int w, List<int> profits, List<int> capital) {
    int n = profits.length;

    // Pair projects
    List<List<int>> projects = [];
    for (int i = 0; i < n; i++) {
      projects.add([capital[i], profits[i]]);
    }

    // Sort by capital
    projects.sort((a, b) => a[0].compareTo(b[0]));

    // Max heap
    var maxHeap = PriorityQueue<int>((a, b) => b.compareTo(a));

    int i = 0;

    for (int j = 0; j < k; j++) {
      // Add all affordable projects
      while (i < n && projects[i][0] <= w) {
        maxHeap.add(projects[i][1]);
        i++;
      }

      if (maxHeap.isEmpty) break;

      // Pick max profit
      w += maxHeap.removeFirst() as int;
    }

    return w;
  }
}