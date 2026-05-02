class Solution(object):
    def maxSatisfaction(self, satisfaction):
        satisfaction.sort()
        
        total = 0      # running sum
        result = 0     # final answer
        
        # traverse from right (largest values)
        for i in range(len(satisfaction) - 1, -1, -1):
            total += satisfaction[i]
            
            if total > 0:
                result += total
            else:
                break
        
        return result