class Solution {
public:
    Node* connect(Node* root) {
        if (!root) return NULL;

        Node* leftMost = root;

        while (leftMost->left) {
            Node* head = leftMost;

            while (head) {
                // left -> right
                head->left->next = head->right;

                // right -> next.left
                if (head->next) {
                    head->right->next = head->next->left;
                }

                head = head->next;
            }

            leftMost = leftMost->left;
        }

        return root;
    }
};