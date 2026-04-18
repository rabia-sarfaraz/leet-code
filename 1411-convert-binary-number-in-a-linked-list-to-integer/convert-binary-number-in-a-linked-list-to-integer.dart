class Solution {
  int getDecimalValue(ListNode? head) {
    int result = 0;

    while (head != null) {
      result = result * 2 + head.val;
      head = head.next;
    }

    return result;
  }
}