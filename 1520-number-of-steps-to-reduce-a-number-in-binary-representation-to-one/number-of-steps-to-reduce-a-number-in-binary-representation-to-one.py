class Solution(object):
    def numSteps(self, s):
        steps = 0
        carry = 0
        
        # traverse from right to left (except first bit)
        for i in range(len(s) - 1, 0, -1):
            bit = int(s[i])
            
            if bit + carry == 1:
                # odd → +1 then /2
                steps += 2
                carry = 1
            else:
                # even → just /2
                steps += 1
        
        # handle MSB
        return steps + carry