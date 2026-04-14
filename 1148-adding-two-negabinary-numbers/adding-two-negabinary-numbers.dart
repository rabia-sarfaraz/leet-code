class Solution {
  List<int> addNegabinary(List<int> arr1, List<int> arr2) {
    int i = arr1.length - 1;
    int j = arr2.length - 1;
    int carry = 0;

    List<int> res = [];

    while (i >= 0 || j >= 0 || carry != 0) {
      int sum = carry;

      if (i >= 0) sum += arr1[i--];
      if (j >= 0) sum += arr2[j--];

      res.add(sum & 1);
      carry = -(sum >> 1);
    }

    // remove leading zeros
    while (res.length > 1 && res.last == 0) {
      res.removeLast();
    }

    return res.reversed.toList();
  }
}