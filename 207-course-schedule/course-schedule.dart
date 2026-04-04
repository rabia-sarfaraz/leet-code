import 'dart:collection';

class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    // Step 1: Graph + indegree
    List<List<int>> graph = List.generate(numCourses, (_) => []);
    List<int> indegree = List.filled(numCourses, 0);

    for (var p in prerequisites) {
      int course = p[0];
      int prereq = p[1];
      graph[prereq].add(course);
      indegree[course]++;
    }

    // Step 2: Queue (indegree = 0)
    Queue<int> queue = Queue();
    for (int i = 0; i < numCourses; i++) {
      if (indegree[i] == 0) {
        queue.add(i);
      }
    }

    // Step 3: BFS
    int count = 0;

    while (queue.isNotEmpty) {
      int current = queue.removeFirst();
      count++;

      for (int neighbor in graph[current]) {
        indegree[neighbor]--;
        if (indegree[neighbor] == 0) {
          queue.add(neighbor);
        }
      }
    }

    // Step 4: Check
    return count == numCourses;
  }
}