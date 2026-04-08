class Node {
  int val;
  Node? next;

  Node(this.val);
}

class MyLinkedList {
  Node? head;
  int size = 0;

  MyLinkedList() {
    head = Node(0); // dummy head
  }

  int get(int index) {
    if (index < 0 || index >= size) return -1;

    Node? curr = head!.next;
    for (int i = 0; i < index; i++) {
      curr = curr!.next;
    }
    return curr!.val;
  }

  void addAtHead(int val) {
    addAtIndex(0, val);
  }

  void addAtTail(int val) {
    addAtIndex(size, val);
  }

  void addAtIndex(int index, int val) {
    if (index > size) return;
    if (index < 0) index = 0;

    Node? prev = head;

    for (int i = 0; i < index; i++) {
      prev = prev!.next;
    }

    Node newNode = Node(val);
    newNode.next = prev!.next;
    prev.next = newNode;

    size++;
  }

  void deleteAtIndex(int index) {
    if (index < 0 || index >= size) return;

    Node? prev = head;

    for (int i = 0; i < index; i++) {
      prev = prev!.next;
    }

    prev!.next = prev.next!.next;
    size--;
  }
}