class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEnd = false;
}

class StreamChecker {
  TrieNode root = TrieNode();
  List<String> stream = [];

  StreamChecker(List<String> words) {
    for (String word in words) {
      _insert(word);
    }
  }

  void _insert(String word) {
    TrieNode node = root;

    for (int i = word.length - 1; i >= 0; i--) {
      String ch = word[i];

      if (!node.children.containsKey(ch)) {
        node.children[ch] = TrieNode();
      }

      node = node.children[ch]!;
    }

    node.isEnd = true;
  }

  bool query(String letter) {
    stream.add(letter);

    TrieNode node = root;

    // traverse from last char backwards
    for (int i = stream.length - 1; i >= 0; i--) {
      String ch = stream[i];

      if (!node.children.containsKey(ch)) {
        return false;
      }

      node = node.children[ch]!;

      if (node.isEnd) return true;
    }

    return false;
  }
}