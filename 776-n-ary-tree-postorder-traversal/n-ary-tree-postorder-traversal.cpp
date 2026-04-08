class Solution {
public:
    vector<int> postorder(Node* root) {
        vector<int> res;
        dfs(root, res);
        return res;
    }

    void dfs(Node* node, vector<int>& res) {
        if (node == NULL) return;

        for (auto child : node->children) {
            dfs(child, res);
        }

        res.push_back(node->val);
    }
};