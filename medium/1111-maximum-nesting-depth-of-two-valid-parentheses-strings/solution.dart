class Solution {
  List<int> maxDepthAfterSplit(String seq) {
    List<int> result = List.filled(seq.length, 0);

    int depth = 0;

    for (int i = 0; i < seq.length; i++) {
      if (seq[i] == '(') {
        depth++;

        // Alternate between group 0 and group 1
        result[i] = depth % 2;
      } else {
        // Closing bracket gets the current group
        result[i] = depth % 2;
        depth--;
      }
    }

    return result;
  }
}