from collections import deque

class Solution(object):
    def minimumJumps(self, forbidden, a, b, x):
        """
        :type forbidden: List[int]
        :type a: int
        :type b: int
        :type x: int
        :rtype: int
        """
        forbidden = set(forbidden)

        limit = max(max(forbidden) if forbidden else 0, x) + a + b + 2000

        q = deque([(0, 0, False)])  # position, steps, usedBackward
        visited = {(0, False)}

        while q:
            pos, steps, back = q.popleft()

            if pos == x:
                return steps

            # Forward jump
            nxt = pos + a
            if (
                nxt <= limit
                and nxt not in forbidden
                and (nxt, False) not in visited
            ):
                visited.add((nxt, False))
                q.append((nxt, steps + 1, False))

            # Backward jump
            nxt = pos - b
            if (
                not back
                and nxt >= 0
                and nxt not in forbidden
                and (nxt, True) not in visited
            ):
                visited.add((nxt, True))
                q.append((nxt, steps + 1, True))

        return -1