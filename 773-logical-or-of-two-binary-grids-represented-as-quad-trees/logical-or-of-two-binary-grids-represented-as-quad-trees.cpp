class Solution {
public:
    Node* intersect(Node* q1, Node* q2) {
        // Case 1: if q1 is leaf
        if (q1->isLeaf) {
            if (q1->val) return new Node(true, true);
            return new Node(q2->val, q2->isLeaf, 
                            q2->topLeft, q2->topRight, 
                            q2->bottomLeft, q2->bottomRight);
        }
        
        // Case 2: if q2 is leaf
        if (q2->isLeaf) {
            if (q2->val) return new Node(true, true);
            return new Node(q1->val, q1->isLeaf, 
                            q1->topLeft, q1->topRight, 
                            q1->bottomLeft, q1->bottomRight);
        }
        
        // Case 3: recurse on children
        Node* tl = intersect(q1->topLeft, q2->topLeft);
        Node* tr = intersect(q1->topRight, q2->topRight);
        Node* bl = intersect(q1->bottomLeft, q2->bottomLeft);
        Node* br = intersect(q1->bottomRight, q2->bottomRight);
        
        // Case 4: merge if possible
        if (tl->isLeaf && tr->isLeaf && bl->isLeaf && br->isLeaf &&
            tl->val == tr->val &&
            tr->val == bl->val &&
            bl->val == br->val) {
            
            return new Node(tl->val, true);
        }
        
        return new Node(false, false, tl, tr, bl, br);
    }
};