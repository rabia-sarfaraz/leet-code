class Solution(object):
    def queensAttacktheKing(self, queens, king):
        queen_set = set((x, y) for x, y in queens)
        
        directions = [
            (1, 0), (-1, 0), (0, 1), (0, -1),
            (1, 1), (1, -1), (-1, 1), (-1, -1)
        ]
        
        result = []
        
        kx, ky = king
        
        for dx, dy in directions:
            x, y = kx + dx, ky + dy
            
            while 0 <= x < 8 and 0 <= y < 8:
                if (x, y) in queen_set:
                    result.append([x, y])
                    break
                x += dx
                y += dy
        
        return result