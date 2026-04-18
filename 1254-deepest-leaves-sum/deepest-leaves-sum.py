from collections import deque

class Solution(object):
    def deepestLeavesSum(self, root):
        q = deque([root])
        result = 0

        while q:
            level_sum = 0
            size = len(q)

            for _ in range(size):
                node = q.popleft()
                level_sum += node.val

                if node.left:
                    q.append(node.left)
                if node.right:
                    q.append(node.right)

            result = level_sum  # overwrite each level

        return result