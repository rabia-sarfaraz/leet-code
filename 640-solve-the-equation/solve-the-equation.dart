class Solution {
  String solveEquation(String equation) {
    int lhsX = 0, lhsNum = 0;
    int rhsX = 0, rhsNum = 0;

    List<String> parts = equation.split('=');

    void parse(String side, bool isLeft) {
      int i = 0;
      int sign = 1;

      while (i < side.length) {
        if (side[i] == '+') {
          sign = 1;
          i++;
        } else if (side[i] == '-') {
          sign = -1;
          i++;
        } else {
          int val = 0;
          bool isNumber = false;

          while (i < side.length &&
              side[i].codeUnitAt(0) >= 48 &&
              side[i].codeUnitAt(0) <= 57) {
            val = val * 10 + (side[i].codeUnitAt(0) - 48);
            i++;
            isNumber = true;
          }

          if (i < side.length && side[i] == 'x') {
            if (!isNumber) val = 1;
            if (isLeft) {
              lhsX += sign * val;
            } else {
              rhsX += sign * val;
            }
            i++;
          } else {
            if (isLeft) {
              lhsNum += sign * val;
            } else {
              rhsNum += sign * val;
            }
          }
        }
      }
    }

    parse(parts[0], true);
    parse(parts[1], false);

    int xCoeff = lhsX - rhsX;
    int constVal = rhsNum - lhsNum;

    if (xCoeff == 0) {
      return constVal == 0 ? "Infinite solutions" : "No solution";
    }

    int x = constVal ~/ xCoeff;
    return "x=$x";
  }
}