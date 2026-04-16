class SnapshotArray {
  late List<List<List<int>>> arr;
  int snapId = 0;

  SnapshotArray(int length) {
    arr = List.generate(length, (_) => [[0, 0]]);
  }
  
  void set(int index, int val) {
    if (arr[index].last[0] == snapId) {
      arr[index].last[1] = val;
    } else {
      arr[index].add([snapId, val]);
    }
  }
  
  int snap() {
    return snapId++;
  }
  
  int get(int index, int snap_id) {
    var list = arr[index];
    
    int l = 0, r = list.length - 1;
    
    while (l <= r) {
      int mid = (l + r) ~/ 2;
      
      if (list[mid][0] <= snap_id) {
        l = mid + 1;
      } else {
        r = mid - 1;
      }
    }
    
    return list[r][1];
  }
}