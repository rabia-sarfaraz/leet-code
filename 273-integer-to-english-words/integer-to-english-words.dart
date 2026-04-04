class Solution {
  final List<String> below20 = [
    "", "One", "Two", "Three", "Four", "Five", "Six", "Seven",
    "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen",
    "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"
  ];

  final List<String> tens = [
    "", "", "Twenty", "Thirty", "Forty", "Fifty",
    "Sixty", "Seventy", "Eighty", "Ninety"
  ];

  String helper(int num) {
    if (num == 0) return "";
    if (num < 20) return below20[num] + " ";
    if (num < 100) {
      return tens[num ~/ 10] + " " + helper(num % 10);
    }
    return below20[num ~/ 100] + " Hundred " + helper(num % 100);
  }

  String numberToWords(int num) {
    if (num == 0) return "Zero";

    String result = "";

    if (num >= 1000000000) {
      result += helper(num ~/ 1000000000) + "Billion ";
      num %= 1000000000;
    }

    if (num >= 1000000) {
      result += helper(num ~/ 1000000) + "Million ";
      num %= 1000000;
    }

    if (num >= 1000) {
      result += helper(num ~/ 1000) + "Thousand ";
      num %= 1000;
    }

    if (num > 0) {
      result += helper(num);
    }

    return result.trim();
  }
}