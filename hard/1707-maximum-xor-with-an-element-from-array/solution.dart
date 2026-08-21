class Solution {
  List<int> maximizeXor(List<int> nums, List<List<int>> queries) {
    nums.sort();

    // [x, m, originalIndex]
    List<List<int>> qs = [];

    for (int i = 0; i < queries.length; i++) {
      qs.add([queries[i][0], queries[i][1], i]);
    }

    // Queries ko m ke according sort karo
    qs.sort((a, b) => a[1].compareTo(b[1]));

    List<int> ans = List.filled(queries.length, -1);

    Trie trie = Trie();
    int index = 0;

    for (var q in qs) {
      int x = q[0];
      int limit = q[1];
      int originalIndex = q[2];

      // limit se chote/equal nums Trie mein add karo
      while (index < nums.length && nums[index] <= limit) {
        trie.insert(nums[index]);
        index++;
      }

      if (index == 0) {
        ans[originalIndex] = -1;
      } else {
        ans[originalIndex] = trie.getMaxXor(x);
      }
    }

    return ans;
  }
}

class TrieNode {
  TrieNode? zero;
  TrieNode? one;
}

class Trie {
  TrieNode root = TrieNode();

  void insert(int num) {
    TrieNode node = root;

    for (int bit = 30; bit >= 0; bit--) {
      int b = (num >> bit) & 1;

      if (b == 0) {
        node.zero ??= TrieNode();
        node = node.zero!;
      } else {
        node.one ??= TrieNode();
        node = node.one!;
      }
    }
  }

  int getMaxXor(int num) {
    TrieNode node = root;
    int result = 0;

    for (int bit = 30; bit >= 0; bit--) {
      int b = (num >> bit) & 1;

      // XOR maximum ke liye opposite bit prefer karo
      if (b == 0) {
        if (node.one != null) {
          result |= (1 << bit);
          node = node.one!;
        } else {
          node = node.zero!;
        }
      } else {
        if (node.zero != null) {
          result |= (1 << bit);
          node = node.zero!;
        } else {
          node = node.one!;
        }
      }
    }

    return result;
  }
}