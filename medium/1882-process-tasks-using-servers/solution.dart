
class Solution {
  List<int> assignTasks(List<int> servers, List<int> tasks) {
    int n = servers.length;

    // Available: [weight, index]
    List<List<int>> available = [];

    // Busy: [freeTime, weight, index]
    List<List<int>> busy = [];

    bool less(List<int> a, List<int> b, bool isBusy) {
      if (isBusy) {
        if (a[0] != b[0]) return a[0] < b[0];
        if (a[1] != b[1]) return a[1] < b[1];
        return a[2] < b[2];
      }

      if (a[0] != b[0]) return a[0] < b[0];
      return a[1] < b[1];
    }

    void push(List<List<int>> heap, List<int> value, bool isBusy) {
      heap.add(value);
      int i = heap.length - 1;

      while (i > 0) {
        int p = (i - 1) ~/ 2;

        if (!less(heap[i], heap[p], isBusy)) break;

        var temp = heap[i];
        heap[i] = heap[p];
        heap[p] = temp;

        i = p;
      }
    }

    List<int> pop(List<List<int>> heap, bool isBusy) {
      var result = heap[0];
      var last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;
        int i = 0;

        while (true) {
          int left = 2 * i + 1;
          int right = 2 * i + 2;
          int smallest = i;

          if (left < heap.length &&
              less(heap[left], heap[smallest], isBusy)) {
            smallest = left;
          }

          if (right < heap.length &&
              less(heap[right], heap[smallest], isBusy)) {
            smallest = right;
          }

          if (smallest == i) break;

          var temp = heap[i];
          heap[i] = heap[smallest];
          heap[smallest] = temp;

          i = smallest;
        }
      }

      return result;
    }

    // Add all servers
    for (int i = 0; i < n; i++) {
      push(available, [servers[i], i], false);
    }

    List<int> answer = [];

    int currentTime = 0;

    for (int i = 0; i < tasks.length; i++) {
      // Maintain global time
      if (currentTime < i) {
        currentTime = i;
      }

      // Release completed servers
      while (busy.isNotEmpty && busy[0][0] <= currentTime) {
        var s = pop(busy, true);
        push(available, [s[1], s[2]], false);
      }

      // Wait until a server becomes available
      if (available.isEmpty) {
        currentTime = busy[0][0];

        while (busy.isNotEmpty &&
            busy[0][0] <= currentTime) {
          var s = pop(busy, true);
          push(available, [s[1], s[2]], false);
        }
      }

      // Select server with minimum weight and index
      var server = pop(available, false);

      int weight = server[0];
      int index = server[1];

      answer.add(index);

      // Schedule task completion
      push(
        busy,
        [currentTime + tasks[i], weight, index],
        true,
      );
    }

    return answer;
  }
}
