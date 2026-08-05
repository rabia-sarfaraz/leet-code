class Solution {
  int furthestBuilding(List<int> heights, int bricks, int ladders) {
    MinHeap heap = MinHeap();

    for (int i = 0; i < heights.length - 1; i++) {
      int climb = heights[i + 1] - heights[i];

      if (climb > 0) {
        heap.add(climb);

        if (heap.size() > ladders) {
          bricks -= heap.removeMin();
        }

        if (bricks < 0) return i;
      }
    }

    return heights.length - 1;
  }
}

class MinHeap {
  List<int> heap = [];

  void add(int val) {
    heap.add(val);
    int i = heap.length - 1;
    while (i > 0) {
      int p = (i - 1) ~/ 2;
      if (heap[p] <= heap[i]) break;
      int t = heap[p];
      heap[p] = heap[i];
      heap[i] = t;
      i = p;
    }
  }

  int removeMin() {
    int res = heap[0];
    heap[0] = heap.last;
    heap.removeLast();

    int i = 0;
    while (true) {
      int l = 2 * i + 1;
      int r = 2 * i + 2;
      int s = i;

      if (l < heap.length && heap[l] < heap[s]) s = l;
      if (r < heap.length && heap[r] < heap[s]) s = r;

      if (s == i) break;

      int t = heap[i];
      heap[i] = heap[s];
      heap[s] = t;
      i = s;
    }

    return res;
  }

  int size() => heap.length;
}