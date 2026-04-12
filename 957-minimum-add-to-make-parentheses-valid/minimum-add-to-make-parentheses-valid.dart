class Solution {
  int minAddToMakeValid(String s) {
    int open = 0;
    int add = 0;

    for (int i = 0; i < s.length; i++) {
      String c = s[i];

      if (c == '(') {
        open++;
      } else {
        if (open > 0) {
          open--;
        } else {
          add++; // need '('
        }
      }
    }

    return add + open;
  }
}