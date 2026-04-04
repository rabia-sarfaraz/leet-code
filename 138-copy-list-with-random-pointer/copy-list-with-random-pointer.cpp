class Solution {
public:
    Node* copyRandomList(Node* head) {
        if (!head) return NULL;

        // Step 1: Copy nodes and insert them
        Node* curr = head;
        while (curr) {
            Node* copy = new Node(curr->val);
            copy->next = curr->next;
            curr->next = copy;
            curr = copy->next;
        }

        // Step 2: Assign random pointers
        curr = head;
        while (curr) {
            if (curr->random) {
                curr->next->random = curr->random->next;
            }
            curr = curr->next->next;
        }

        // Step 3: Separate the lists
        curr = head;
        Node* dummy = new Node(0);
        Node* copyCurr = dummy;

        while (curr) {
            Node* copy = curr->next;
            copyCurr->next = copy;
            copyCurr = copy;

            curr->next = copy->next;
            curr = curr->next;
        }

        return dummy->next;
    }
};