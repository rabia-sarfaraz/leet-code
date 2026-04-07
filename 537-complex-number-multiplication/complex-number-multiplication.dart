class Solution {
  String complexNumberMultiply(String num1, String num2) {
    List<String> p1 = num1.split('+');
    List<String> p2 = num2.split('+');

    int a = int.parse(p1[0]);
    int b = int.parse(p1[1].replaceAll('i', ''));

    int c = int.parse(p2[0]);
    int d = int.parse(p2[1].replaceAll('i', ''));

    int real = a * c - b * d;
    int imag = a * d + b * c;

    return '$real+${imag}i';
  }
}