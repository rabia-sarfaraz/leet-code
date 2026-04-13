class Solution {
  List<int> addToArrayForm(List<int> num, int k) {
    List<int> res = [];
    int i = num.length - 1;

    while (i >= 0 || k > 0) {
      if (i >= 0) {
        k += num[i];
        i--;
      }

      res.add(k % 10);
      k ~/= 10;
    }

    res = res.reversed.toList();
    return res;
  }
}