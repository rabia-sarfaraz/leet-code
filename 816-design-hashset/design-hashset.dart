class MyHashSet {
  late List<bool> data;

  MyHashSet() {
    data = List.filled(1000001, false);
  }

  void add(int key) {
    data[key] = true;
  }

  void remove(int key) {
    data[key] = false;
  }

  bool contains(int key) {
    return data[key];
  }
}