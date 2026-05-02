class Solution(object):
    def checkOverlap(self, radius, xCenter, yCenter, x1, y1, x2, y2):
        
        # Clamp function
        def clamp(val, low, high):
            return max(low, min(val, high))
        
        # Closest point inside rectangle
        closestX = clamp(xCenter, x1, x2)
        closestY = clamp(yCenter, y1, y2)
        
        # Distance squared
        dx = xCenter - closestX
        dy = yCenter - closestY
        
        return dx * dx + dy * dy <= radius * radius