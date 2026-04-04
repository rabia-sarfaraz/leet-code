class Solution {
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? current = head;

    while (current != null) {
      ListNode? nextTemp = current.next; // store next
      current.next = prev;               // reverse link
      prev = current;                   // move prev
      current = nextTemp;               // move current
    }

    return prev;
  }
}