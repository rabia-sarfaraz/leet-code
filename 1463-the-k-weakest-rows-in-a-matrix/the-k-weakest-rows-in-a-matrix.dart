class Solution {
  List<int> kWeakestRows(List<List<int>> mat, int k) {
    List<List<int>> strength = [];

    // Step 1: count soldiers in each row
    for (int i = 0; i < mat.length; i++) {
      int count = 0;
      for (int val in mat[i]) {
        if (val == 1) count++;
        else break; // since 1s come first
      }
      strength.add([count, i]);
    }

    // Step 2: sort by soldiers, then index
    strength.sort((a, b) {
      if (a[0] != b[0]) return a[0].compareTo(b[0]);
      return a[1].compareTo(b[1]);
    });

    // Step 3: take first k indices
    return strength.take(k).map((e) => e[1]).toList();
  }
}