class Solution {
  bool isValid(String s) {
    List<String> stack = [];

    for (var ch in s.split('')) {
      stack.add(ch);

      // Check last 3 characters
      if (stack.length >= 3 &&
          stack[stack.length - 3] == 'a' &&
          stack[stack.length - 2] == 'b' &&
          stack[stack.length - 1] == 'c') {
        
        // remove "abc"
        stack.removeLast();
        stack.removeLast();
        stack.removeLast();
      }
    }

    return stack.isEmpty;
  }
}