class Solution {
public:
    vector<int> processQueries(vector<int>& queries, int m) {
        vector<int> P, result;
        
        // Initialize permutation
        for (int i = 1; i <= m; i++) {
            P.push_back(i);
        }
        
        for (int q : queries) {
            int index = 0;
            
            // Find index of q
            for (int i = 0; i < P.size(); i++) {
                if (P[i] == q) {
                    index = i;
                    break;
                }
            }
            
            result.push_back(index);
            
            // Move q to front
            P.erase(P.begin() + index);
            P.insert(P.begin(), q);
        }
        
        return result;
    }
};