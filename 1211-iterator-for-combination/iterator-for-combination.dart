class CombinationIterator {
  List<String> combinations = [];
  int index = 0;

  CombinationIterator(String characters, int combinationLength) {
    _generate(characters, combinationLength, 0, "");
  }

  void _generate(String s, int len, int start, String path) {
    if (path.length == len) {
      combinations.add(path);
      return;
    }

    for (int i = start; i < s.length; i++) {
      _generate(s, len, i + 1, path + s[i]);
    }
  }

  String next() {
    return combinations[index++];
  }

  bool hasNext() {
    return index < combinations.length;
  }
}