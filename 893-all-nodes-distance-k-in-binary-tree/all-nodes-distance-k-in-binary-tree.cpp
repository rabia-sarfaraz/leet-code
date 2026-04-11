class Solution {
public:
    unordered_map<TreeNode*, vector<TreeNode*>> graph;
    unordered_set<TreeNode*> visited;

    void buildGraph(TreeNode* node, TreeNode* parent) {
        if (!node) return;

        if (parent) {
            graph[node].push_back(parent);
            graph[parent].push_back(node);
        }

        buildGraph(node->left, node);
        buildGraph(node->right, node);
    }

    vector<int> distanceK(TreeNode* root, TreeNode* target, int k) {
        buildGraph(root, nullptr);

        queue<TreeNode*> q;
        q.push(target);
        visited.insert(target);

        int dist = 0;

        while (!q.empty()) {
            int size = q.size();

            if (dist == k) break;

            while (size--) {
                TreeNode* node = q.front();
                q.pop();

                for (auto nei : graph[node]) {
                    if (!visited.count(nei)) {
                        visited.insert(nei);
                        q.push(nei);
                    }
                }
            }

            dist++;
        }

        vector<int> ans;
        while (!q.empty()) {
            ans.push_back(q.front()->val);
            q.pop();
        }

        return ans;
    }
};