import 'dart:collection';

class Solution {
  int eatenApples(List<int> apples, List<int> days) {
    // [expiryDay, numberOfApples]
    Heap heap = Heap();

    int eaten = 0;
    int day = 0;

    while (day < apples.length || heap.isNotEmpty) {
      // Aaj ke apples add karo
      if (day < apples.length && apples[day] > 0) {
        heap.add([
          day + days[day],
          apples[day]
        ]);
      }

      // Expired apples remove karo
      while (heap.isNotEmpty && heap.peek()[0] <= day) {
        heap.remove();
      }

      // Sabse pehle expire hone wala batch khao
      if (heap.isNotEmpty) {
        var current = heap.remove();

        eaten++;

        if (current[1] > 1) {
          heap.add([
            current[0],
            current[1] - 1
          ]);
        }
      }

      day++;
    }

    return eaten;
  }
}

class Heap {
  final List<List<int>> _heap = [];

  bool get isNotEmpty => _heap.isNotEmpty;

  void add(List<int> value) {
    _heap.add(value);
    int i = _heap.length - 1;

    while (i > 0) {
      int parent = (i - 1) ~/ 2;

      if (_heap[parent][0] <= _heap[i][0]) break;

      var temp = _heap[parent];
      _heap[parent] = _heap[i];
      _heap[i] = temp;

      i = parent;
    }
  }

  List<int> peek() => _heap[0];

  List<int> remove() {
    var result = _heap[0];
    var last = _heap.removeLast();

    if (_heap.isNotEmpty) {
      _heap[0] = last;

      int i = 0;

      while (true) {
        int left = i * 2 + 1;
        int right = i * 2 + 2;
        int smallest = i;

        if (left < _heap.length &&
            _heap[left][0] < _heap[smallest][0]) {
          smallest = left;
        }

        if (right < _heap.length &&
            _heap[right][0] < _heap[smallest][0]) {
          smallest = right;
        }

        if (smallest == i) break;

        var temp = _heap[i];
        _heap[i] = _heap[smallest];
        _heap[smallest] = temp;

        i = smallest;
      }
    }

    return result;
  }
}