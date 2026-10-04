class Solution {
  bool checkValidString(String s) {
    int minOpen = 0;
    int maxOpen = 0;

    for (int i = 0; i < s.length; i++) {
      if (s[i] == '(') {
        minOpen++;
        maxOpen++;
      } else if (s[i] == ')') {
        minOpen--;
        maxOpen--;
      } else {
        // '*' ko ')' ya '(' dono tarah use kar sakte hain
        minOpen--;
        maxOpen++;
      }

      // Minimum negative ho sakta hai, kyun ke '*' empty bhi ho sakta hai
      if (minOpen < 0) {
        minOpen = 0;
      }

      // Agar maximum negative ho gaya to valid nahi ho sakta
      if (maxOpen < 0) {
        return false;
      }
    }

    return minOpen == 0;
  }
}