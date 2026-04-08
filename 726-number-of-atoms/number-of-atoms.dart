class Solution {
  String countOfAtoms(String formula) {
    int i = 0;
    int n = formula.length;

    List<Map<String, int>> stack = [<String, int>{}];

    int readNum() {
      if (i >= n || formula.codeUnitAt(i) < 48 || formula.codeUnitAt(i) > 57) {
        return 1;
      }
      int num = 0;
      while (i < n &&
          formula.codeUnitAt(i) >= 48 &&
          formula.codeUnitAt(i) <= 57) {
        num = num * 10 + (formula.codeUnitAt(i) - 48);
        i++;
      }
      return num;
    }

    String readAtom() {
      String atom = formula[i]; // uppercase
      i++;
      while (i < n &&
          formula.codeUnitAt(i) >= 97 &&
          formula.codeUnitAt(i) <= 122) {
        atom += formula[i];
        i++;
      }
      return atom;
    }

    while (i < n) {
      if (formula[i] == '(') {
        i++;
        stack.add(<String, int>{});
      } else if (formula[i] == ')') {
        i++;
        int mult = readNum();
        Map<String, int> top = stack.removeLast();

        top.forEach((key, val) {
          stack.last[key] = (stack.last[key] ?? 0) + val * mult;
        });
      } else {
        String atom = readAtom();
        int count = readNum();
        stack.last[atom] = (stack.last[atom] ?? 0) + count;
      }
    }

    List<String> atoms = stack.last.keys.toList()..sort();

    StringBuffer sb = StringBuffer();
    for (String a in atoms) {
      sb.write(a);
      int c = stack.last[a]!;
      if (c > 1) sb.write(c);
    }

    return sb.toString();
  }
}