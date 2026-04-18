class Solution(object):
    def maxCandies(self, status, candies, keys, containedBoxes, initialBoxes):
        haveBoxes = set(initialBoxes)
        haveKeys = set()
        used = set()

        from collections import deque
        queue = deque(initialBoxes)

        waiting = set()
        total = 0

        while queue:
            box = queue.popleft()

            if box in used:
                continue

            # if locked and no key → wait
            if status[box] == 0 and box not in haveKeys:
                waiting.add(box)
                continue

            used.add(box)
            total += candies[box]

            # collect keys
            for k in keys[box]:
                haveKeys.add(k)
                if k in waiting or k in haveBoxes:
                    queue.append(k)

            # collect boxes inside
            for b in containedBoxes[box]:
                haveBoxes.add(b)
                if status[b] == 1 or b in haveKeys:
                    queue.append(b)
                else:
                    waiting.add(b)

        return total