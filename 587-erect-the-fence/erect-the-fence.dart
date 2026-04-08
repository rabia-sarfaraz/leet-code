class Solution {
  List<List<int>> outerTrees(List<List<int>> trees) {
    trees.sort((a, b) {
      if (a[0] == b[0]) return a[1] - b[1];
      return a[0] - b[0];
    });

    List<List<int>> lower = [];
    List<List<int>> upper = [];

    int cross(List<int> o, List<int> a, List<int> b) {
      return (a[0] - o[0]) * (b[1] - o[1]) -
             (a[1] - o[1]) * (b[0] - o[0]);
    }

    for (var p in trees) {
      while (lower.length >= 2 &&
          cross(lower[lower.length - 2], lower.last, p) < 0) {
        lower.removeLast();
      }
      lower.add(p);
    }

    for (int i = trees.length - 1; i >= 0; i--) {
      var p = trees[i];
      while (upper.length >= 2 &&
          cross(upper[upper.length - 2], upper.last, p) < 0) {
        upper.removeLast();
      }
      upper.add(p);
    }

    Set<String> seen = {};
    List<List<int>> res = [];

    for (var p in lower + upper) {
      String key = "${p[0]},${p[1]}";
      if (!seen.contains(key)) {
        seen.add(key);
        res.add(p);
      }
    }

    return res;
  }
}