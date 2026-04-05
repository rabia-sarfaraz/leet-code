class Solution {
  bool isValidSerialization(String preorder) {
    List<String> nodes = preorder.split(',');
    int slots = 1;

    for (String node in nodes) {
      slots--; // consume slot

      if (slots < 0) return false;

      if (node != '#') {
        slots += 2; // non-null node creates 2 slots
      }
    }

    return slots == 0;
  }
}