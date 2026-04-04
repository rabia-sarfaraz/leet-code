class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEnd = false;
}

class Trie {
  late TrieNode root;

  Trie() {
    root = TrieNode();
  }
  
  void insert(String word) {
    TrieNode node = root;

    for (int i = 0; i < word.length; i++) {
      String ch = word[i];

      node.children.putIfAbsent(ch, () => TrieNode());
      node = node.children[ch]!;
    }

    node.isEnd = true;
  }
  
  bool search(String word) {
    TrieNode? node = _searchPrefix(word);
    return node != null && node.isEnd;
  }
  
  bool startsWith(String prefix) {
    return _searchPrefix(prefix) != null;
  }

  TrieNode? _searchPrefix(String word) {
    TrieNode node = root;

    for (int i = 0; i < word.length; i++) {
      String ch = word[i];

      if (!node.children.containsKey(ch)) {
        return null;
      }
      node = node.children[ch]!;
    }

    return node;
  }
}