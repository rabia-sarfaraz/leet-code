class TrieNode {
  TrieNode? zero;
  TrieNode? one;
}

class Solution {
  late TrieNode root;

  void insert(int num) {
    TrieNode node = root;

    for (int i = 31; i >= 0; i--) {
      int bit = (num >> i) & 1;

      if (bit == 0) {
        node.zero ??= TrieNode();
        node = node.zero!;
      } else {
        node.one ??= TrieNode();
        node = node.one!;
      }
    }
  }

  int findMax(int num) {
    TrieNode node = root;
    int xor = 0;

    for (int i = 31; i >= 0; i--) {
      int bit = (num >> i) & 1;

      // we want opposite bit
      if (bit == 0) {
        if (node.one != null) {
          xor |= (1 << i);
          node = node.one!;
        } else {
          node = node.zero!;
        }
      } else {
        if (node.zero != null) {
          xor |= (1 << i);
          node = node.zero!;
        } else {
          node = node.one!;
        }
      }
    }

    return xor;
  }

  int findMaximumXOR(List<int> nums) {
    root = TrieNode();

    for (int num in nums) {
      insert(num);
    }

    int maxXor = 0;

    for (int num in nums) {
      maxXor = maxXor > findMax(num) ? maxXor : findMax(num);
    }

    return maxXor;
  }
}