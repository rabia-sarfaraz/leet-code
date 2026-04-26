class Solution(object):
    def longestZigZag(self, root):
        """
        :type root: Optional[TreeNode]
        :rtype: int
        """
        self.ans = 0

        def dfs(node):
            if not node:
                return -1, -1

            left = dfs(node.left)
            right = dfs(node.right)

            go_left = left[1] + 1
            go_right = right[0] + 1

            self.ans = max(self.ans, go_left, go_right)

            return go_left, go_right

        dfs(root)
        return self.ans