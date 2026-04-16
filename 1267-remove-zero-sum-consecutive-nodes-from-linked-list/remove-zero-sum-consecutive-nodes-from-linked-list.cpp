class Solution {
public:
    ListNode* removeZeroSumSublists(ListNode* head) {
        ListNode dummy(0);
        dummy.next = head;

        unordered_map<int, ListNode*> mp;
        int prefix = 0;

        // First pass: build prefix sum map
        for (ListNode* node = &dummy; node != nullptr; node = node->next) {
            prefix += node->val;
            mp[prefix] = node;
        }

        // Second pass: remove zero-sum sequences
        prefix = 0;
        for (ListNode* node = &dummy; node != nullptr; node = node->next) {
            prefix += node->val;
            node->next = mp[prefix]->next;
        }

        return dummy.next;
    }
};