class Solution {
public:
    string entityParser(string text) {
        unordered_map<string, string> mp = {
            {"&quot;", "\""},
            {"&apos;", "'"},
            {"&amp;", "&"},
            {"&gt;", ">"},
            {"&lt;", "<"},
            {"&frasl;", "/"}
        };
        
        string result;
        
        for (int i = 0; i < text.size(); i++) {
            if (text[i] == '&') {
                string temp;
                bool found = false;
                
                for (int j = i; j < text.size() && j < i + 10; j++) {
                    temp += text[j];
                    
                    if (text[j] == ';') {
                        if (mp.count(temp)) {
                            result += mp[temp];
                            i = j; // move forward
                            found = true;
                        }
                        break;
                    }
                }
                
                if (!found) {
                    result += '&'; // only add '&', not full temp
                }
            } else {
                result += text[i];
            }
        }
        
        return result;
    }
};