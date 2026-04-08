class MyCircularQueue {
  late List<int> arr;
  int k;
  int front = 0;
  int size = 0;

  MyCircularQueue(this.k) {
    arr = List.filled(k, 0);
  }

  bool enQueue(int value) {
    if (isFull()) return false;

    int rear = (front + size) % k;
    arr[rear] = value;
    size++;
    return true;
  }

  bool deQueue() {
    if (isEmpty()) return false;

    front = (front + 1) % k;
    size--;
    return true;
  }

  int Front() {
    if (isEmpty()) return -1;
    return arr[front];
  }

  int Rear() {
    if (isEmpty()) return -1;

    int rear = (front + size - 1) % k;
    return arr[rear];
  }

  bool isEmpty() {
    return size == 0;
  }

  bool isFull() {
    return size == k;
  }
}