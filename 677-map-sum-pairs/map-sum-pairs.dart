class TrieNode {
  Map<String, TrieNode> children = {};
  int value = 0;
}

class MapSum {
  TrieNode root = TrieNode();
  Map<String, int> map = {};

  MapSum();

  void insert(String key, int val) {
    int delta = val - (map[key] ?? 0);
    map[key] = val;

    TrieNode node = root;

    for (int i = 0; i < key.length; i++) {
      String ch = key[i];
      node.children.putIfAbsent(ch, () => TrieNode());
      node = node.children[ch]!;
      node.value += delta;
    }
  }

  int sum(String prefix) {
    TrieNode node = root;

    for (int i = 0; i < prefix.length; i++) {
      String ch = prefix[i];
      if (!node.children.containsKey(ch)) {
        return 0;
      }
      node = node.children[ch]!;
    }

    return node.value;
  }
}