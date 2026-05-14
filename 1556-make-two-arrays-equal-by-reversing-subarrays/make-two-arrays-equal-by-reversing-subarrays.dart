class Solution {
  bool canBeEqual(List<int> target, List<int> arr) {
    target.sort();
    arr.sort();

    if (target.length != arr.length) return false;

    for (int i = 0; i < target.length; i++) {
      if (target[i] != arr[i]) {
        return false;
      }
    }

    return true;
  }
}