class Solution {
  List<List<int>> reconstructMatrix(int upper, int lower, List<int> colsum) {
    int sum = 0;
    for (int v in colsum) sum += v;

    if (sum != upper + lower) return [];

    List<int> row1 = List.filled(colsum.length, 0);
    List<int> row2 = List.filled(colsum.length, 0);

    for (int i = 0; i < colsum.length; i++) {
      if (colsum[i] == 2) {
        row1[i] = 1;
        row2[i] = 1;
        upper--;
        lower--;
      }
    }

    for (int i = 0; i < colsum.length; i++) {
      if (colsum[i] == 1) {
        if (upper > 0) {
          row1[i] = 1;
          upper--;
        } else {
          row2[i] = 1;
          lower--;
        }
      }
    }

    if (upper != 0 || lower != 0) return [];

    return [row1, row2];
  }
}