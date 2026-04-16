class Solution {
  List<int> pathInZigZagTree(int label) {
    List<int> path = [];
    
    while (label >= 1) {
      path.add(label);
      
      int level = (log(label) / log(2)).floor();
      
      int start = 1 << level;
      int end = (1 << (level + 1)) - 1;
      
      // convert to normal
      int normal = start + end - label;
      
      // move to parent
      label = normal ~/ 2;
    }
    
    return path.reversed.toList();
  }
}