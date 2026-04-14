class Solution {
  int twoCitySchedCost(List<List<int>> costs) {
    costs.sort((a, b) => (a[0] - a[1]).compareTo(b[0] - b[1]));

    int n = costs.length ~/ 2;
    int total = 0;

    for (int i = 0; i < costs.length; i++) {
      if (i < n) {
        total += costs[i][0]; // send to A
      } else {
        total += costs[i][1]; // send to B
      }
    }

    return total;
  }
}