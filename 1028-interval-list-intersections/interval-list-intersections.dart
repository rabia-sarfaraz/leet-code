class Solution {
  List<List<int>> intervalIntersection(
      List<List<int>> firstList, List<List<int>> secondList) {
    
    List<List<int>> res = [];
    int i = 0, j = 0;

    while (i < firstList.length && j < secondList.length) {
      int start = firstList[i][0] > secondList[j][0]
          ? firstList[i][0]
          : secondList[j][0];

      int end = firstList[i][1] < secondList[j][1]
          ? firstList[i][1]
          : secondList[j][1];

      // valid intersection
      if (start <= end) {
        res.add([start, end]);
      }

      // move pointer
      if (firstList[i][1] < secondList[j][1]) {
        i++;
      } else {
        j++;
      }
    }

    return res;
  }
}