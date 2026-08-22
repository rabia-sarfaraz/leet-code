class Solution {
  int minimumBoxes(int n) {
    int floor = 0;
    int total = 0;

    // Complete pyramid layers
    while (total + (floor + 1) * (floor + 2) ~/ 2 <= n) {
      floor++;
      total += floor * (floor + 1) ~/ 2;
    }

    int base = floor * (floor + 1) ~/ 2;

    // Remaining boxes ko base par add karo
    int current = 0;

    while (total < n) {
      current++;
      total += current;
      base++;
    }

    return base;
  }
}