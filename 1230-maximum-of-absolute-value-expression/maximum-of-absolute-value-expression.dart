class Solution {
  int maxAbsValExpr(List<int> arr1, List<int> arr2) {
    int n = arr1.length;
    int res = 0;
    
    List<List<int>> signs = [
      [1, 1, 1],
      [1, 1, -1],
      [1, -1, 1],
      [1, -1, -1],
    ];
    
    for (var s in signs) {
      int maxVal = -1000000000;
      int minVal = 1000000000;
      
      for (int i = 0; i < n; i++) {
        int val = s[0] * arr1[i] + s[1] * arr2[i] + s[2] * i;
        
        if (val > maxVal) maxVal = val;
        if (val < minVal) minVal = val;
      }
      
      if (maxVal - minVal > res) {
        res = maxVal - minVal;
      }
    }
    
    return res;
  }
}