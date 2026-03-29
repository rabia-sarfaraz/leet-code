class Solution {
  List<int> grayCode(int n) {
    List<int> result = [];

    int size = 1 << n; // 2^n

    for (int i = 0; i < size; i++) {
      result.add(i ^ (i >> 1));
    }

    return result;
  }
}