class Solution {
public:
    vector<int> preorder(Node* root) {
        vector<int> res;
        dfs(root, res);
        return res;
    }

    void dfs(Node* node, vector<int>& res) {
        if (node == NULL) return;

        res.push_back(node->val);

        for (auto child : node->children) {
            dfs(child, res);
        }
    }
};