import 'dart:collection';

class KthLargest {
  int k;
  List<int> heap = [];

  KthLargest(int k, List<int> nums) : k = k {
    for (int n in nums) {
      add(n);
    }
  }

  int add(int val) {
    heap.add(val);
    _heapifyUp(heap.length - 1);

    if (heap.length > k) {
      _removeTop();
    }

    return heap[0];
  }

  // remove smallest (root)
  void _removeTop() {
    _swap(0, heap.length - 1);
    heap.removeLast();
    _heapifyDown(0);
  }

  void _heapifyUp(int i) {
    while (i > 0) {
      int p = (i - 1) ~/ 2;
      if (heap[p] <= heap[i]) break;
      _swap(p, i);
      i = p;
    }
  }

  void _heapifyDown(int i) {
    int n = heap.length;

    while (true) {
      int smallest = i;
      int l = 2 * i + 1;
      int r = 2 * i + 2;

      if (l < n && heap[l] < heap[smallest]) smallest = l;
      if (r < n && heap[r] < heap[smallest]) smallest = r;

      if (smallest == i) break;

      _swap(i, smallest);
      i = smallest;
    }
  }

  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }
}