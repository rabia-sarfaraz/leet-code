class Solution(object):
    def maxDistance(self, side, points, k):
        def get_pos(x, y):
            if y == 0:
                return x
            if x == side:
                return side + y
            if y == side:
                return 3 * side - x
            return 4 * side - y

        pts = sorted((get_pos(x, y), x, y) for x, y in points)
        n = len(pts)
        perimeter = 4 * side

        pos = [p[0] for p in pts]
        coords = [(p[1], p[2]) for p in pts]

        ext_pos = pos + [x + perimeter for x in pos]
        ext_coords = coords + coords

        def manhattan(i, j):
            x1, y1 = ext_coords[i]
            x2, y2 = ext_coords[j]
            return abs(x1 - x2) + abs(y1 - y2)

        def can(d):
            nxt = [0] * (2 * n)
            j = 0

            for i in range(2 * n):
                while j < 2 * n and ext_pos[j] - ext_pos[i] < d:
                    j += 1
                nxt[i] = j

            for start in range(n):
                cur = start

                for _ in range(k - 1):
                    cur = nxt[cur]
                    if cur >= start + n:
                        break

                if cur < start + n and manhattan(start, cur) >= d:
                    return True

            return False

        low, high = 0, 2 * side

        while low < high:
            mid = (low + high + 1) // 2
            if can(mid):
                low = mid
            else:
                high = mid - 1

        return low