class Solution {
public:
    vector<TreeNode*> ans;
    unordered_set<int> del;

    TreeNode* dfs(TreeNode* root, bool hasParent) {
        if (!root) return nullptr;

        bool deleted = del.count(root->val);

        if (!deleted && !hasParent) {
            ans.push_back(root);
        }

        root->left = dfs(root->left, !deleted);
        root->right = dfs(root->right, !deleted);

        return deleted ? nullptr : root;
    }

    vector<TreeNode*> delNodes(TreeNode* root, vector<int>& to_delete) {
        del.clear();
        ans.clear();

        for (int x : to_delete) {
            del.insert(x);
        }

        dfs(root, false);
        return ans;
    }
};