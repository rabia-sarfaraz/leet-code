class Solution {
  bool canFormArray(List<int> arr, List<List<int>> pieces) {
    Map<int, List<int>> mp = {};

    for (var piece in pieces) {
      mp[piece[0]] = piece;
    }

    int i = 0;

    while (i < arr.length) {
      if (!mp.containsKey(arr[i])) return false;

      List<int> piece = mp[arr[i]]!;

      for (int num in piece) {
        if (i >= arr.length || arr[i] != num) {
          return false;
        }
        i++;
      }
    }

    return true;
  }
}