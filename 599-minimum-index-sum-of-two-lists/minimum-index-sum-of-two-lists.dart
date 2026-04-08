class Solution {
  List<String> findRestaurant(List<String> list1, List<String> list2) {
    Map<String, int> indexMap = {};

    for (int i = 0; i < list1.length; i++) {
      indexMap[list1[i]] = i;
    }

    int minSum = 1 << 30;
    List<String> result = [];

    for (int j = 0; j < list2.length; j++) {
      String name = list2[j];

      if (indexMap.containsKey(name)) {
        int sum = j + indexMap[name]!;

        if (sum < minSum) {
          minSum = sum;
          result = [name];
        } else if (sum == minSum) {
          result.add(name);
        }
      }
    }

    return result;
  }
}