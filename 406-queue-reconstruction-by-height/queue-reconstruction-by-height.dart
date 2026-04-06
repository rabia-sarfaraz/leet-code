class Solution {
  List<List<int>> reconstructQueue(List<List<int>> people) {
    // Step 1: sort by height desc, k asc
    people.sort((a, b) {
      if (a[0] != b[0]) {
        return b[0] - a[0];
      }
      return a[1] - b[1];
    });

    List<List<int>> result = [];

    // Step 2: insert at index k
    for (var p in people) {
      result.insert(p[1], p);
    }

    return result;
  }
}