abstract class FlSize {
  FlSize();

  factory FlSize.size(double size) {
    return FlSizeNumber(size);
  }

  factory FlSize.scale() {
    return FlSizeScale();
  }
}

class FlSizeNumber extends FlSize {
  final double number;

  FlSizeNumber(this.number);
}

class FlSizeScale extends FlSize {}
