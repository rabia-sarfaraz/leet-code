class Solution {
  List<List<int>> groupThePeople(List<int> groupSizes) {
    Map<int, List<int>> map = {};
    List<List<int>> result = [];

    for (int i = 0; i < groupSizes.length; i++) {
      int size = groupSizes[i];

      map.putIfAbsent(size, () => []);
      map[size]!.add(i);

      if (map[size]!.length == size) {
        result.add(List.from(map[size]!));
        map[size]!.clear();
      }
    }

    return result;
  }
}