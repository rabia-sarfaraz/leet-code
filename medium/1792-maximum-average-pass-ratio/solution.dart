class Solution {
  double maxAverageRatio(List<List<int>> classes, int extraStudents) {
    List<List<dynamic>> heap = [];

    double gain(int pass, int total) {
      return (pass + 1) / (total + 1) - pass / total;
    }

    void push(List<dynamic> item) {
      heap.add(item);
      int i = heap.length - 1;

      while (i > 0) {
        int parent = (i - 1) ~/ 2;

        if (heap[parent][0] >= heap[i][0]) break;

        var temp = heap[parent];
        heap[parent] = heap[i];
        heap[i] = temp;

        i = parent;
      }
    }

    List<dynamic> pop() {
      var result = heap[0];
      var last = heap.removeLast();

      if (heap.isNotEmpty) {
        heap[0] = last;
        int i = 0;

        while (true) {
          int left = i * 2 + 1;
          int right = i * 2 + 2;
          int largest = i;

          if (left < heap.length &&
              heap[left][0] > heap[largest][0]) {
            largest = left;
          }

          if (right < heap.length &&
              heap[right][0] > heap[largest][0]) {
            largest = right;
          }

          if (largest == i) break;

          var temp = heap[i];
          heap[i] = heap[largest];
          heap[largest] = temp;

          i = largest;
        }
      }

      return result;
    }

    // Build max heap
    for (var c in classes) {
      int pass = c[0];
      int total = c[1];

      push([gain(pass, total), pass, total]);
    }

    // Add extra students greedily
    for (int i = 0; i < extraStudents; i++) {
      var current = pop();

      int pass = current[1];
      int total = current[2];

      pass++;
      total++;

      push([gain(pass, total), pass, total]);
    }

    double result = 0;

    for (var item in heap) {
      int pass = item[1];
      int total = item[2];

      result += pass / total;
    }

    return result / classes.length;
  }
}