class Solution {
  int longestDecomposition(String text) {
    int n = text.length;
    
    String left = "";
    String right = "";
    
    int i = 0;
    int j = n - 1;
    int count = 0;

    while (i < j) {
      left += text[i];
      right = text[j] + right;
      
      if (left == right) {
        count += 2;
        left = "";
        right = "";
      }
      
      i++;
      j--;
    }

    // agar beech ka part bach gaya
    if (left.isNotEmpty || i == j) {
      count += 1;
    }

    return count;
  }
}