class Codec {
public:

    // Encodes a tree to a single string.
    string serialize(TreeNode* root) {
        string result = "";
        helperSerialize(root, result);
        return result;
    }

    void helperSerialize(TreeNode* root, string &result) {
        if (!root) {
            result += "N,";
            return;
        }

        result += to_string(root->val) + ",";
        helperSerialize(root->left, result);
        helperSerialize(root->right, result);
    }

    // Decodes your encoded data to tree.
    TreeNode* deserialize(string data) {
        vector<string> nodes;
        string temp;

        for (char c : data) {
            if (c == ',') {
                nodes.push_back(temp);
                temp = "";
            } else {
                temp += c;
            }
        }

        int index = 0;
        return helperDeserialize(nodes, index);
    }

    TreeNode* helperDeserialize(vector<string>& nodes, int &index) {
        if (nodes[index] == "N") {
            index++;
            return NULL;
        }

        TreeNode* root = new TreeNode(stoi(nodes[index]));
        index++;

        root->left = helperDeserialize(nodes, index);
        root->right = helperDeserialize(nodes, index);

        return root;
    }
};