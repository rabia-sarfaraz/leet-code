class Solution(object):
    def getAllElements(self, root1, root2):
        def inorder(root, arr):
            if not root:
                return
            inorder(root.left, arr)
            arr.append(root.val)
            inorder(root.right, arr)

        list1, list2 = [], []
        inorder(root1, list1)
        inorder(root2, list2)

        i = j = 0
        res = []

        while i < len(list1) and j < len(list2):
            if list1[i] < list2[j]:
                res.append(list1[i])
                i += 1
            else:
                res.append(list2[j])
                j += 1

        res.extend(list1[i:])
        res.extend(list2[j:])

        return res