from collections import deque

class Solution(object):
    def canReach(self, arr, start):
        n = len(arr)
        visited = set()

        q = deque([start])

        while q:
            i = q.popleft()

            if arr[i] == 0:
                return True

            if i in visited:
                continue

            visited.add(i)

            for nxt in (i + arr[i], i - arr[i]):
                if 0 <= nxt < n and nxt not in visited:
                    q.append(nxt)

        return False