class Solution {
  List<int> countPoints(
      List<List<int>> points, List<List<int>> queries) {
    
    List<int> answer = [];

    for (List<int> query in queries) {
      int cx = query[0];
      int cy = query[1];
      int r = query[2];

      int count = 0;

      for (List<int> point in points) {
        int x = point[0];
        int y = point[1];

        int dx = x - cx;
        int dy = y - cy;

        // Distance squared <= radius squared
        if (dx * dx + dy * dy <= r * r) {
          count++;
        }
      }

      answer.add(count);
    }

    return answer;
  }
}