class Solution(object):
    def balancedStringSplit(self, s):
        balance = 0
        count = 0
        
        for ch in s:
            if ch == 'L':
                balance += 1
            else:
                balance -= 1
            
            if balance == 0:
                count += 1
        
        return count