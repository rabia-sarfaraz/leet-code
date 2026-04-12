class Solution {
  List<int> powerfulIntegers(int x, int y, int bound) {
    Set<int> result = {};

    Set<int> powX = {};
    Set<int> powY = {};

    // generate powers of x
    int a = 1;
    while (a <= bound) {
      powX.add(a);
      if (x == 1) break;
      a *= x;
    }

    // generate powers of y
    int b = 1;
    while (b <= bound) {
      powY.add(b);
      if (y == 1) break;
      b *= y;
    }

    for (int i in powX) {
      for (int j in powY) {
        int sum = i + j;
        if (sum <= bound) {
          result.add(sum);
        }
      }
    }

    return result.toList();
  }
}