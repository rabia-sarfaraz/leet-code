import 'dart:collection';

class Solution {
  int findKthLargest(List<int> nums, int k) {
    // Min heap using SplayTreeSet (sorted unique workaround not allowed for duplicates)
    // Better: use custom list as heap

    List<int> heap = [];

    void heapifyUp(int i) {
      while (i > 0) {
        int parent = (i - 1) ~/ 2;
        if (heap[parent] <= heap[i]) break;
        int temp = heap[parent];
        heap[parent] = heap[i];
        heap[i] = temp;
        i = parent;
      }
    }

    void heapifyDown(int i) {
      int n = heap.length;

      while (true) {
        int smallest = i;
        int left = 2 * i + 1;
        int right = 2 * i + 2;

        if (left < n && heap[left] < heap[smallest]) {
          smallest = left;
        }

        if (right < n && heap[right] < heap[smallest]) {
          smallest = right;
        }

        if (smallest == i) break;

        int temp = heap[i];
        heap[i] = heap[smallest];
        heap[smallest] = temp;

        i = smallest;
      }
    }

    void add(int val) {
      heap.add(val);
      heapifyUp(heap.length - 1);

      if (heap.length > k) {
        heap[0] = heap.removeLast();
        heapifyDown(0);
      }
    }

    for (int num in nums) {
      add(num);
    }

    return heap[0];
  }
}