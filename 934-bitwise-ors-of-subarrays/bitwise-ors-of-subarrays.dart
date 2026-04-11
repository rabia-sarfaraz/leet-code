class Solution {
  int subarrayBitwiseORs(List<int> arr) {
    Set<int> res = {};
    Set<int> cur = {};

    for (int x in arr) {
      Set<int> next = {x};

      for (int v in cur) {
        next.add(v | x);
      }

      cur = next;
      res.addAll(cur);
    }

    return res.length;
  }
}