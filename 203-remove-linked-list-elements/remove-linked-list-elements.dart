class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    // Dummy node to handle edge cases
    ListNode dummy = ListNode(0);
    dummy.next = head;

    ListNode? current = dummy;

    while (current?.next != null) {
      if (current!.next!.val == val) {
        // Skip the node
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }

    return dummy.next;
  }
}