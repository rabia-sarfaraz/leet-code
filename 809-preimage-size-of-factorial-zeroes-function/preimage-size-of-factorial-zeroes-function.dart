class Solution {
  int preimageSizeFZF(int k) {

    int countZero(int x) {
      int res = 0;
      while (x > 0) {
        x ~/= 5;
        res += x;
      }
      return res;
    }

    int low = 0, high = 5 * (k + 1);

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      int z = countZero(mid);

      if (z < k) {
        low = mid + 1;
      } else if (z > k) {
        high = mid - 1;
      } else {
        return 5; // found at least one x → always 5 solutions
      }
    }

    return 0;
  }
}