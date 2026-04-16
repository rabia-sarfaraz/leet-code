class Solution {
  bool parseBoolExpr(String expression) {
    List<String> stack = [];
    
    for (int i = 0; i < expression.length; i++) {
      String ch = expression[i];
      
      if (ch == ',' ) continue;
      
      if (ch != ')') {
        stack.add(ch);
      } else {
        // evaluate
        int t = 0, f = 0;
        
        while (stack.isNotEmpty && stack.last != '(') {
          if (stack.last == 't') t++;
          if (stack.last == 'f') f++;
          stack.removeLast();
        }
        
        // remove '('
        stack.removeLast();
        
        // operator
        String op = stack.removeLast();
        
        String result;
        
        if (op == '!') {
          result = (f == 1) ? 't' : 'f';
        } else if (op == '&') {
          result = (f == 0) ? 't' : 'f';
        } else { // '|'
          result = (t > 0) ? 't' : 'f';
        }
        
        stack.add(result);
      }
    }
    
    return stack.last == 't';
  }
}