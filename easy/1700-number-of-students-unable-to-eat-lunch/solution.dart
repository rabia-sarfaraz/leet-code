class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    int circle = 0;
    int square = 0;

    for (int s in students) {
      if (s == 0) {
        circle++;
      } else {
        square++;
      }
    }

    int i = 0;

    while (i < sandwiches.length) {
      if (sandwiches[i] == 0) {
        if (circle == 0) break;
        circle--;
      } else {
        if (square == 0) break;
        square--;
      }

      i++;
    }

    return sandwiches.length - i;
  }
}