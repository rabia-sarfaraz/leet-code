class Solution {
  Map<int, int> freq = {};
  int maxFreq = 0;

  List<int> findFrequentTreeSum(TreeNode? root) {
    dfs(root);

    List<int> result = [];
    freq.forEach((sum, count) {
      if (count == maxFreq) {
        result.add(sum);
      }
    });

    return result;
  }

  int dfs(TreeNode? node) {
    if (node == null) return 0;

    int left = dfs(node.left);
    int right = dfs(node.right);

    int sum = left + right + node.val;

    freq[sum] = (freq[sum] ?? 0) + 1;
    maxFreq = maxFreq > freq[sum]! ? maxFreq : freq[sum]!;

    return sum;
  }
}