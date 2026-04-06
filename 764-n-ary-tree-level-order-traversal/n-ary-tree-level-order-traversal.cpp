class Solution {
public:
    vector<vector<int>> levelOrder(Node* root) {
        vector<vector<int>> result;
        if (!root) return result;

        queue<Node*> q;
        q.push(root);

        while (!q.empty()) {
            int size = q.size();
            vector<int> level;

            for (int i = 0; i < size; i++) {
                Node* node = q.front();
                q.pop();

                level.push_back(node->val);

                for (Node* child : node->children) {
                    if (child) q.push(child);
                }
            }

            result.push_back(level);
        }

        return result;
    }
};