class Solution {
  String destCity(List<List<String>> paths) {
    Set<String> starts = {};

    // Store all starting cities
    for (var path in paths) {
      starts.add(path[0]);
    }

    // Destination city will never appear as a start city
    for (var path in paths) {
      if (!starts.contains(path[1])) {
        return path[1];
      }
    }

    return "";
  }
}