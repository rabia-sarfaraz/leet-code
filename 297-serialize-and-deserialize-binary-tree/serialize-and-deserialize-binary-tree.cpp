class Codec {
public:

    // Encodes a tree to a single string.
    string serialize(TreeNode* root) {
        if (!root) return "";

        string result = "";
        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()) {
            TreeNode* node = q.front();
            q.pop();

            if (node == NULL) {
                result += "null,";
                continue;
            }

            result += to_string(node->val) + ",";
            q.push(node->left);
            q.push(node->right);
        }

        return result;
    }

    // Decodes your encoded data to tree.
    TreeNode* deserialize(string data) {
        if (data.empty()) return NULL;

        stringstream ss(data);
        string val;

        getline(ss, val, ',');
        TreeNode* root = new TreeNode(stoi(val));

        queue<TreeNode*> q;
        q.push(root);

        while (!q.empty()) {
            TreeNode* node = q.front();
            q.pop();

            // left child
            if (!getline(ss, val, ',')) break;
            if (val != "null") {
                node->left = new TreeNode(stoi(val));
                q.push(node->left);
            }

            // right child
            if (!getline(ss, val, ',')) break;
            if (val != "null") {
                node->right = new TreeNode(stoi(val));
                q.push(node->right);
            }
        }

        return root;
    }
};