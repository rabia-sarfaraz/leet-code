class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEnd = false;
}

class Solution {
  late TrieNode root;

  String replaceWords(List<String> dictionary, String sentence) {
    root = TrieNode();

    // build trie
    for (String word in dictionary) {
      TrieNode node = root;
      for (int i = 0; i < word.length; i++) {
        String ch = word[i];
        node.children.putIfAbsent(ch, () => TrieNode());
        node = node.children[ch]!;
      }
      node.isEnd = true;
    }

    List<String> words = sentence.split(' ');
    List<String> result = [];

    for (String word in words) {
      result.add(_getRoot(word));
    }

    return result.join(' ');
  }

  String _getRoot(String word) {
    TrieNode node = root;
    StringBuffer sb = StringBuffer();

    for (int i = 0; i < word.length; i++) {
      String ch = word[i];

      if (!node.children.containsKey(ch)) {
        return word;
      }

      node = node.children[ch]!;
      sb.write(ch);

      if (node.isEnd) {
        return sb.toString();
      }
    }

    return word;
  }
}