class Solution {
  List<int> findDiagonalOrder(List<List<int>> nums) {
    Map<int, List<int>> diag = {};
    int maxKey = 0;

    for (int i = 0; i < nums.length; i++) {
      for (int j = 0; j < nums[i].length; j++) {
        int key = i + j;

        diag.putIfAbsent(key, () => []);
        
        // reverse order maintain karne ke liye
        diag[key]!.insert(0, nums[i][j]);

        if (key > maxKey) maxKey = key;
      }
    }

    List<int> result = [];

    for (int k = 0; k <= maxKey; k++) {
      if (diag.containsKey(k)) {
        result.addAll(diag[k]!);
      }
    }

    return result;
  }
}