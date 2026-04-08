class Solution {
  TreeNode? constructMaximumBinaryTree(List<int> nums) {
    return build(nums, 0, nums.length - 1);
  }

  TreeNode? build(List<int> nums, int l, int r) {
    if (l > r) return null;

    int maxIndex = l;

    for (int i = l; i <= r; i++) {
      if (nums[i] > nums[maxIndex]) {
        maxIndex = i;
      }
    }

    TreeNode node = TreeNode(nums[maxIndex]);

    node.left = build(nums, l, maxIndex - 1);
    node.right = build(nums, maxIndex + 1, r);

    return node;
  }
}