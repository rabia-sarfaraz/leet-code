class Solution {
  int mctFromLeafValues(List<int> arr) {
    List<int> stack = [];
    int res = 0;
    
    for (int num in arr) {
      while (stack.isNotEmpty && stack.last <= num) {
        int mid = stack.removeLast();
        
        if (stack.isEmpty) {
          res += mid * num;
        } else {
          res += mid * (stack.last < num ? stack.last : num);
        }
      }
      
      stack.add(num);
    }
    
    while (stack.length > 1) {
      int top = stack.removeLast();
      res += top * stack.last;
    }
    
    return res;
  }
}