class Solution {
  ListNode? sortList(ListNode? head) {
    if (head == null || head.next == null) return head;

    // Step 1: Find middle
    ListNode? slow = head;
    ListNode? fast = head;
    ListNode? prev = null;

    while (fast != null && fast.next != null) {
      prev = slow;
      slow = slow!.next;
      fast = fast.next!.next;
    }

    // split list
    prev!.next = null;

    // Step 2: sort left and right
    ListNode? left = sortList(head);
    ListNode? right = sortList(slow);

    // Step 3: merge
    return _merge(left, right);
  }

  ListNode? _merge(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0);
    ListNode curr = dummy;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        curr.next = l1;
        l1 = l1.next;
      } else {
        curr.next = l2;
        l2 = l2.next;
      }
      curr = curr.next!;
    }

    curr.next = l1 ?? l2;

    return dummy.next;
  }
}