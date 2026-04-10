class Solution {
  List<int> splitIntoFibonacci(String num) {
    List<int> path = [];

    bool backtrack(int index) {
      if (index == num.length) {
        return path.length >= 3;
      }

      int current = 0;

      for (int i = index; i < num.length; i++) {
        // leading zero check
        if (i > index && num[index] == '0') break;

        current = current * 10 + (num.codeUnitAt(i) - 48);

        if (current > 2147483647) break;

        int size = path.length;

        if (size >= 2) {
          int sum = path[size - 1] + path[size - 2];

          if (current < sum) continue;
          if (current > sum) break;
        }

        path.add(current);

        if (backtrack(i + 1)) return true;

        path.removeLast();
      }

      return false;
    }

    backtrack(0);

    return path;
  }
}