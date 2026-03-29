class Solution {
  ListNode? partition(ListNode? head, int x) {
    ListNode beforeHead = ListNode(0);
    ListNode afterHead = ListNode(0);

    ListNode before = beforeHead;
    ListNode after = afterHead;

    while (head != null) {
      if (head.val < x) {
        before.next = head;
        before = before.next!;
      } else {
        after.next = head;
        after = after.next!;
      }

      head = head.next;
    }

    // important: after list ko end karo
    after.next = null;

    // merge both lists
    before.next = afterHead.next;

    return beforeHead.next;
  }
}