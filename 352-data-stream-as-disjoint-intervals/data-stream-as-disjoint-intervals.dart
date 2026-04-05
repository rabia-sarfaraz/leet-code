class SummaryRanges {
  Set<int> nums = {};

  SummaryRanges() {
    nums = {};
  }

  void addNum(int value) {
    nums.add(value);
  }

  List<List<int>> getIntervals() {
    List<int> sorted = nums.toList()..sort();

    List<List<int>> result = [];

    if (sorted.isEmpty) return result;

    int start = sorted[0];
    int end = sorted[0];

    for (int i = 1; i < sorted.length; i++) {
      if (sorted[i] == end + 1) {
        end = sorted[i];
      } else {
        result.add([start, end]);
        start = sorted[i];
        end = sorted[i];
      }
    }

    result.add([start, end]);

    return result;
  }
}