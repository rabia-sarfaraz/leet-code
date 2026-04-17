import 'dart:math';

class Node {
  int val;
  List<Node?> forward;

  Node(this.val, int level) : forward = List.filled(level, null);
}

class Skiplist {
  static const int MAX_LEVEL = 16;
  static const double P = 0.5;

  final Random _rand = Random();
  Node head = Node(-1, MAX_LEVEL);
  int level = 1;

  Skiplist();

  bool search(int target) {
    Node curr = head;

    for (int i = level - 1; i >= 0; i--) {
      while (curr.forward[i] != null &&
          curr.forward[i]!.val < target) {
        curr = curr.forward[i]!;
      }
    }

    Node? next = curr.forward[0];
    return next != null && next.val == target;
  }

  void add(int num) {
    List<Node?> update = List.filled(MAX_LEVEL, null);
    Node curr = head;

    for (int i = level - 1; i >= 0; i--) {
      while (curr.forward[i] != null &&
          curr.forward[i]!.val < num) {
        curr = curr.forward[i]!;
      }
      update[i] = curr;
    }

    int lv = _randomLevel();

    if (lv > level) {
      for (int i = level; i < lv; i++) {
        update[i] = head;
      }
      level = lv;
    }

    Node newNode = Node(num, lv);

    for (int i = 0; i < lv; i++) {
      newNode.forward[i] = update[i]!.forward[i];
      update[i]!.forward[i] = newNode;
    }
  }

  bool erase(int num) {
    List<Node?> update = List.filled(MAX_LEVEL, null);
    Node curr = head;

    for (int i = level - 1; i >= 0; i--) {
      while (curr.forward[i] != null &&
          curr.forward[i]!.val < num) {
        curr = curr.forward[i]!;
      }
      update[i] = curr;
    }

    Node? target = curr.forward[0];
    if (target == null || target.val != num) return false;

    for (int i = 0; i < level; i++) {
      if (update[i]!.forward[i] != target) break;
      update[i]!.forward[i] = target.forward[i];
    }

    return true;
  }

  int _randomLevel() {
    int lv = 1;
    while (_rand.nextDouble() < P && lv < MAX_LEVEL) {
      lv++;
    }
    return lv;
  }
}