class Solution {
  List<int> decode(List<int> encoded) {
    int n = encoded.length + 1;

    // 1 ^ 2 ^ 3 ^ ... ^ n
    int total = 0;
    for (int i = 1; i <= n; i++) {
      total ^= i;
    }

    // encoded ke odd indices ka XOR
    int odd = 0;
    for (int i = 1; i < encoded.length; i += 2) {
      odd ^= encoded[i];
    }

    // ans[0] find karo
    int first = total ^ odd;

    List<int> ans = [first];

    // Baqi permutation decode karo
    for (int x in encoded) {
      ans.add(ans.last ^ x);
    }

    return ans;
  }
}