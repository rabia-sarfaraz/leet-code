class Node {
  int key, value;
  Node? prev, next;

  Node(this.key, this.value);
}

class LRUCache {
  int capacity;
  Map<int, Node> map = {};
  Node head = Node(0, 0);
  Node tail = Node(0, 0);

  LRUCache(this.capacity) {
    head.next = tail;
    tail.prev = head;
  }

  void _remove(Node node) {
    node.prev!.next = node.next;
    node.next!.prev = node.prev;
  }

  void _insert(Node node) {
    node.next = head.next;
    node.prev = head;
    head.next!.prev = node;
    head.next = node;
  }

  int get(int key) {
    if (!map.containsKey(key)) return -1;

    Node node = map[key]!;

    _remove(node);
    _insert(node);

    return node.value;
  }

  void put(int key, int value) {
    if (map.containsKey(key)) {
      _remove(map[key]!);
    }

    Node node = Node(key, value);
    map[key] = node;
    _insert(node);

    if (map.length > capacity) {
      Node lru = tail.prev!;
      _remove(lru);
      map.remove(lru.key);
    }
  }
}