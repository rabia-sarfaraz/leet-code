class Solution {
  int maxProduct(List<String> words) {
    int n = words.length;

    List<int> masks = List.filled(n, 0);
    List<int> lengths = List.filled(n, 0);

    for (int i = 0; i < n; i++) {
      int mask = 0;
      for (int j = 0; j < words[i].length; j++) {
        mask |= 1 << (words[i].codeUnitAt(j) - 97);
      }
      masks[i] = mask;
      lengths[i] = words[i].length;
    }

    int maxProd = 0;

    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if ((masks[i] & masks[j]) == 0) {
          int prod = lengths[i] * lengths[j];
          if (prod > maxProd) {
            maxProd = prod;
          }
        }
      }
    }

    return maxProd;
  }
}