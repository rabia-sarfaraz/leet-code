class Solution {
  int numEquivDominoPairs(List<List<int>> dominoes) {
    Map<String, int> freq = {};
    int res = 0;
    
    for (var d in dominoes) {
      int a = d[0];
      int b = d[1];
      
      int x = a < b ? a : b;
      int y = a < b ? b : a;
      
      String key = "$x,$y";
      
      freq[key] = (freq[key] ?? 0) + 1;
    }
    
    for (int count in freq.values) {
      res += (count * (count - 1)) ~/ 2;
    }
    
    return res;
  }
}