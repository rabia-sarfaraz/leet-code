class Solution(object):
    def maxRepeating(self, sequence, word):
        """
        :type sequence: str
        :type word: str
        :rtype: int
        """
        count = 0
        temp = word
        
        while temp in sequence:
            count += 1
            temp += word
            
        return count