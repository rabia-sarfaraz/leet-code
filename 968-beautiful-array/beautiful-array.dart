class Solution {
  List<int> beautifulArray(int n) {
    List<int> res = [1];

    while (res.length < n) {
      List<int> temp = [];

      // odd numbers
      for (int x in res) {
        if (2 * x - 1 <= n) {
          temp.add(2 * x - 1);
        }
      }

      // even numbers
      for (int x in res) {
        if (2 * x <= n) {
          temp.add(2 * x);
        }
      }

      res = temp;
    }

    return res;
  }
}