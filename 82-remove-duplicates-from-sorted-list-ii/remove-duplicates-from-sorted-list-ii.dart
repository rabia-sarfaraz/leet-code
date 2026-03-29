class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    ListNode dummy = ListNode(0);
    dummy.next = head;

    ListNode? prev = dummy;
    ListNode? current = head;

    while (current != null) {
      bool duplicate = false;

      // check duplicates
      while (current!.next != null && current.val == current.next!.val) {
        duplicate = true;
        current = current.next;
      }

      if (duplicate) {
        // skip all duplicates
        prev!.next = current.next;
      } else {
        prev = prev!.next;
      }

      current = current.next;
    }

    return dummy.next;
  }
}