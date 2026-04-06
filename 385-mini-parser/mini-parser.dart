class Solution {
  NestedInteger deserialize(String s) {
    if (s.isEmpty) return NestedInteger();

    if (s[0] != '[') {
      return NestedInteger(int.parse(s));
    }

    List<NestedInteger> stack = [];
    NestedInteger? current;
    int num = 0;
    int sign = 1;
    bool buildingNumber = false;

    for (int i = 0; i < s.length; i++) {
      String ch = s[i];

      if (ch == '-') {
        sign = -1;
        buildingNumber = true;
      } 
      else if (ch.codeUnitAt(0) >= '0'.codeUnitAt(0) &&
               ch.codeUnitAt(0) <= '9'.codeUnitAt(0)) {
        num = num * 10 + (ch.codeUnitAt(0) - '0'.codeUnitAt(0));
        buildingNumber = true;
      } 
      else if (ch == '[') {
        NestedInteger ni = NestedInteger();
        if (current != null) {
          current.add(ni);
          stack.add(current);
        }
        current = ni;
      } 
      else if (ch == ',' || ch == ']') {
        if (buildingNumber) {
          NestedInteger ni = NestedInteger(sign * num);
          current!.add(ni);
        }
        num = 0;
        sign = 1;
        buildingNumber = false;

        if (ch == ']' && stack.isNotEmpty) {
          current = stack.removeLast();
        }
      }
    }

    return current!;
  }
}