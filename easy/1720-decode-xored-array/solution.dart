class Solution {
  List<int> decode(List<int> encoded, int first) {
    List<int> ans = [first];

    for (int i = 0; i < encoded.length; i++) {
      ans.add(ans[i] ^ encoded[i]);
    }

    return ans;
  }
}