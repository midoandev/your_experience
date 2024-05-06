
extension DoubleHelper on double {
  String get roundPercentageAsPrecision =>
      '${toStringAsPrecision(2)}%';

  double get pxToDouble {
    return 0.08333333 * toDouble();
  }

}
extension IntegerHelper on int {
  double get pxToDouble {
    return 0.08333333 * this;
  }

}
