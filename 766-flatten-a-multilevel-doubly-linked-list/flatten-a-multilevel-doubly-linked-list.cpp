class Solution {
public:
    Node* flatten(Node* head) {
        if (!head) return head;

        Node* dummy = new Node(0);
        Node* prev = dummy;

        stack<Node*> st;
        st.push(head);

        while (!st.empty()) {
            Node* curr = st.top();
            st.pop();

            prev->next = curr;
            curr->prev = prev;

            if (curr->next) st.push(curr->next);
            if (curr->child) st.push(curr->child);

            curr->child = NULL;
            prev = curr;
        }

        dummy->next->prev = NULL;
        return dummy->next;
    }
};