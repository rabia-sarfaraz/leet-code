class Solution(object):
    def maxNumOfSubstrings(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        
        n = len(s)
        left = [n] * 26
        right = [-1] * 26
        
        for i, ch in enumerate(s):
            idx = ord(ch) - ord('a')
            left[idx] = min(left[idx], i)
            right[idx] = i
        
        intervals = []
        
        for c in range(26):
            if right[c] == -1:
                continue
                
            l, r = left[c], right[c]
            j = l
            
            valid = True
            while j <= r:
                idx = ord(s[j]) - ord('a')
                
                if left[idx] < l:
                    valid = False
                    break
                    
                r = max(r, right[idx])
                j += 1
            
            if valid:
                intervals.append((l, r))
        
        intervals.sort(key=lambda x: x[1])
        
        res = []
        end = -1
        
        for l, r in intervals:
            if l > end:
                res.append(s[l:r + 1])
                end = r
        
        return res