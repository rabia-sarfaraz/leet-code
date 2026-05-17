class Solution {
  bool canReach(List<int> arr, int start) {
    List<bool> visited = List.filled(arr.length, false);

    List<int> queue = [start];
    visited[start] = true;

    while (queue.isNotEmpty) {
      int i = queue.removeAt(0);

      if (arr[i] == 0) {
        return true;
      }

      int forward = i + arr[i];
      int backward = i - arr[i];

      if (forward >= 0 &&
          forward < arr.length &&
          !visited[forward]) {
        visited[forward] = true;
        queue.add(forward);
      }

      if (backward >= 0 &&
          backward < arr.length &&
          !visited[backward]) {
        visited[backward] = true;
        queue.add(backward);
      }
    }

    return false;
  }
}