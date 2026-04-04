class Solution {
  bool isPalindrome(ListNode? head) {
    if (head == null || head.next == null) return true;

    // 1. Find middle
    ListNode? slow = head;
    ListNode? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }

    // 2. Reverse second half
    ListNode? second = _reverse(slow);

    // 3. Compare both halves
    ListNode? first = head;

    while (second != null) {
      if (first!.val != second.val) return false;
      first = first.next;
      second = second.next;
    }

    return true;
  }

  ListNode? _reverse(ListNode? head) {
    ListNode? prev;
    ListNode? curr = head;

    while (curr != null) {
      ListNode? next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }

    return prev;
  }
}