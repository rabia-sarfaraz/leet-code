class Solution {
  List<bool> checkIfPrerequisite(
      int numCourses,
      List<List<int>> prerequisites,
      List<List<int>> queries) {

    List<List<bool>> reach = List.generate(
      numCourses,
      (_) => List.filled(numCourses, false),
    );

    // Direct prerequisites
    for (var p in prerequisites) {
      reach[p[0]][p[1]] = true;
    }

    // Floyd-Warshall
    for (int k = 0; k < numCourses; k++) {
      for (int i = 0; i < numCourses; i++) {
        for (int j = 0; j < numCourses; j++) {
          if (reach[i][k] && reach[k][j]) {
            reach[i][j] = true;
          }
        }
      }
    }

    List<bool> ans = [];

    for (var q in queries) {
      ans.add(reach[q[0]][q[1]]);
    }

    return ans;
  }
}