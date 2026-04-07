import 'dart:math';

class Solution {
  late double radius;
  late double x_center;
  late double y_center;
  final Random _rand = Random();

  Solution(num radius, num x_center, num y_center) {
    this.radius = radius.toDouble();
    this.x_center = x_center.toDouble();
    this.y_center = y_center.toDouble();
  }

  List<double> randPoint() {
    double theta = _rand.nextDouble() * 2 * pi;
    double r = radius * sqrt(_rand.nextDouble());

    double x = x_center + r * cos(theta);
    double y = y_center + r * sin(theta);

    return [x, y];
  }
}