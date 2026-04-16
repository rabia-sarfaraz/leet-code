class Solution {
  int longestWPI(List<int> hours) {
    Map<int, int> firstIndex = {};
    
    int score = 0;
    int res = 0;
    
    firstIndex[0] = -1; // very important base case
    
    for (int i = 0; i < hours.length; i++) {
      score += hours[i] > 8 ? 1 : -1;
      
      // if positive, whole array till i is valid
      if (score > 0) {
        res = i + 1;
      } else {
        // store first occurrence of score
        if (!firstIndex.containsKey(score)) {
          firstIndex[score] = i;
        }
        
        // check score - 1
        if (firstIndex.containsKey(score - 1)) {
          res = res > (i - firstIndex[score - 1]!)
              ? res
              : (i - firstIndex[score - 1]!);
        }
      }
    }
    
    return res;
  }
}