class Solution {
public:
    string alphabetBoardPath(string target) {
        int curR = 0, curC = 0;
        string res = "";
        
        for (char ch : target) {
            int idx = ch - 'a';
            int r = idx / 5;
            int c = idx % 5;
            
            // special case: move up/left first when going to 'z'
            while (curR > r) {
                res += "U";
                curR--;
            }
            
            while (curC > c) {
                res += "L";
                curC--;
            }
            
            while (curC < c) {
                res += "R";
                curC++;
            }
            
            while (curR < r) {
                res += "D";
                curR++;
            }
            
            res += "!";
        }
        
        return res;
    }
};