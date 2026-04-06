import 'dart:collection';

class _Bucket {
  int count;
  Set<String> keys = {};
  _Bucket? prev;
  _Bucket? next;

  _Bucket(this.count);
}

class AllOne {
  _Bucket head = _Bucket(0);
  _Bucket tail = _Bucket(0);

  Map<String, _Bucket> map = {};

  AllOne() {
    head.next = tail;
    tail.prev = head;
  }

  void _addAfter(_Bucket node, _Bucket newNode) {
    newNode.next = node.next;
    newNode.prev = node;
    node.next!.prev = newNode;
    node.next = newNode;
  }

  void _remove(_Bucket node) {
    node.prev!.next = node.next;
    node.next!.prev = node.prev;
  }

  void inc(String key) {
    if (!map.containsKey(key)) {
      if (head.next == tail || head.next!.count > 1) {
        _addAfter(head, _Bucket(1));
      }
      head.next!.keys.add(key);
      map[key] = head.next!;
    } else {
      _Bucket cur = map[key]!;
      int newCount = cur.count + 1;

      _Bucket? nextBucket = cur.next;
      if (nextBucket == tail || nextBucket!.count > newCount) {
        _addAfter(cur, _Bucket(newCount));
      }

      _Bucket target = cur.next!;
      target.keys.add(key);
      map[key] = target;

      cur.keys.remove(key);
      if (cur.keys.isEmpty) _remove(cur);
    }
  }

  void dec(String key) {
    if (!map.containsKey(key)) return;

    _Bucket cur = map[key]!;

    if (cur.count == 1) {
      cur.keys.remove(key);
      map.remove(key);
    } else {
      int newCount = cur.count - 1;
      _Bucket? prevBucket = cur.prev;

      if (prevBucket == head || prevBucket!.count < newCount) {
        _addAfter(cur.prev!, _Bucket(newCount));
      }

      _Bucket target = cur.prev!;
      target.keys.add(key);
      map[key] = target;

      cur.keys.remove(key);
    }

    if (cur.keys.isEmpty) _remove(cur);
  }

  String getMaxKey() {
    if (tail.prev == head) return "";
    return tail.prev!.keys.first;
  }

  String getMinKey() {
    if (head.next == tail) return "";
    return head.next!.keys.first;
  }
}