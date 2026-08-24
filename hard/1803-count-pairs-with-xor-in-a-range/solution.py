class Solution(object):
    def countPairs(self, nums, low, high):
        """
        :type nums: List[int]
        :type low: int
        :type high: int
        :rtype: int
        """

        def count_less(limit):
            if limit <= 0:
                return 0

            class Node:
                def __init__(self):
                    self.child = [None, None]
                    self.count = 0

            root = Node()
            answer = 0

            def insert(num):
                node = root

                for bit in range(14, -1, -1):
                    b = (num >> bit) & 1

                    if node.child[b] is None:
                        node.child[b] = Node()

                    node = node.child[b]
                    node.count += 1

            def query(num):
                node = root
                result = 0

                for bit in range(14, -1, -1):
                    if node is None:
                        break

                    a = (num >> bit) & 1
                    l = (limit >> bit) & 1

                    if l == 1:
                        # XOR bit = 0 => definitely smaller
                        if node.child[a] is not None:
                            result += node.child[a].count

                        # XOR bit = 1 => continue
                        node = node.child[1 - a]

                    else:
                        # XOR bit must be 0
                        node = node.child[a]

                return result

            for num in nums:
                answer += query(num)
                insert(num)

            return answer

        return count_less(high + 1) - count_less(low)