class Solution {
  List<int> exclusiveTime(int n, List<String> logs) {
    List<int> result = List.filled(n, 0);
    List<int> stack = [];

    int prevTime = 0;

    for (String log in logs) {
      var parts = log.split(':');
      int id = int.parse(parts[0]);
      String type = parts[1];
      int time = int.parse(parts[2]);

      if (type == "start") {
        if (stack.isNotEmpty) {
          result[stack.last] += time - prevTime;
        }
        stack.add(id);
        prevTime = time;
      } else {
        result[stack.last] += time - prevTime + 1;
        stack.removeLast();
        prevTime = time + 1;
      }
    }

    return result;
  }
}