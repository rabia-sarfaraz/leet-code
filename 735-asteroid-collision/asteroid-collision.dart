class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    List<int> stack = [];

    for (int a in asteroids) {
      
      bool destroyed = false;

      while (stack.isNotEmpty &&
          stack.last > 0 &&
          a < 0) {
        
        if (stack.last < -a) {
          stack.removeLast(); // top dies
          continue;
        } else if (stack.last == -a) {
          stack.removeLast(); // both die
          destroyed = true;
          break;
        } else {
          destroyed = true; // current dies
          break;
        }
      }

      if (!destroyed) {
        stack.add(a);
      }
    }

    return stack;
  }
}