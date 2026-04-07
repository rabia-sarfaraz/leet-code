class Solution {
  int findMinMoves(List<int> machines) {
    int n = machines.length;
    int sum = 0;

    for (int x in machines) sum += x;

    if (sum % n != 0) return -1;

    int avg = sum ~/ n;
    int balance = 0;
    int result = 0;

    for (int i = 0; i < n; i++) {
      int diff = machines[i] - avg;

      balance += diff;

      // max moves needed
      result = result > balance.abs() ? result : balance.abs();
      result = result > diff ? result : diff;
    }

    return result;
  }
}