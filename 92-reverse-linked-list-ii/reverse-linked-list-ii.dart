class Solution {
  ListNode? reverseBetween(ListNode? head, int left, int right) {
    if (head == null || left == right) return head;

    ListNode dummy = ListNode(0);
    dummy.next = head;

    ListNode? prev = dummy;

    // 1) move prev to just before left
    for (int i = 1; i < left; i++) {
      prev = prev!.next;
    }

    // 2) start reversing
    ListNode? current = prev!.next;
    ListNode? next;

    for (int i = 0; i < right - left; i++) {
      next = current!.next;
      current.next = next!.next;
      next.next = prev.next;
      prev.next = next;
    }

    return dummy.next;
  }
}