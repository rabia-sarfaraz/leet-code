class Solution {
  String pushDominoes(String dominoes) {
    List<String> arr = dominoes.split('');
    int n = arr.length;

    int i = 0;
    String prev = 'L';

    for (int j = 0; j <= n; j++) {
      String curr = (j < n) ? arr[j] : 'R';

      if (curr == '.') continue;

      if (curr == prev) {
        for (int k = i; k < j; k++) {
          arr[k] = curr;
        }
      } 
      else if (prev == 'R' && curr == 'L') {
        int l = i, r = j - 1;
        while (l < r) {
          arr[l++] = 'R';
          arr[r--] = 'L';
        }
      }

      prev = curr;
      i = j + 1;
    }

    return arr.join('');
  }
}