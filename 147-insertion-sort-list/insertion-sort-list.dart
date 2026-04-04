class Solution {
  ListNode? insertionSortList(ListNode? head) {
    if (head == null) return null;

    ListNode dummy = ListNode(0);
    ListNode? curr = head;

    while (curr != null) {
      ListNode? next = curr.next;

      ListNode? prev = dummy;

      // find position
      while (prev!.next != null && prev.next!.val < curr.val) {
        prev = prev.next;
      }

      // insert curr
      curr.next = prev.next;
      prev.next = curr;

      curr = next;
    }

    return dummy.next;
  }
}