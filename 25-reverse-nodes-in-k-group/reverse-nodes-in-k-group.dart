class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    if (head == null || k == 1) return head;

    ListNode dummy = ListNode(0, head);
    ListNode? prevGroup = dummy;

    while (true) {
      // Check if k nodes exist
      ListNode? kth = prevGroup;
      for (int i = 0; i < k && kth != null; i++) {
        kth = kth.next;
      }
      if (kth == null) break;

      ListNode? groupNext = kth.next;

      // Reverse group
      ListNode? prev = groupNext;
      ListNode? curr = prevGroup!.next;

      while (curr != groupNext) {
        ListNode? temp = curr!.next;
        curr.next = prev;
        prev = curr;
        curr = temp;
      }

      // Connect with previous part
      ListNode? temp = prevGroup.next;
      prevGroup.next = kth;
      prevGroup = temp;
    }

    return dummy.next;
  }
}