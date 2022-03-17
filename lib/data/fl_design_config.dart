import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/data/fl_size.dart';

class FlDesignConfig {
  final FlSize margin;
  final FlSize body;
  final int layoutColumns;
  final double gutters;
  final DeviceTarget deviceTarget;
  final double? navigationRailWidth;
  final double appbarHeight;

  FlDesignConfig(
      {required this.margin,
      required this.body,
      required this.deviceTarget,
      this.navigationRailWidth,
      this.appbarHeight = 56,
      this.layoutColumns = 1,
      this.gutters = 12}) {
    assert(body is FlSizeNumber || margin is FlSizeNumber,
        "Required at least body or margin is number");

    if (deviceTarget == DeviceTarget.tablet) {
      assert(navigationRailWidth != null,
          "NavigationRailWidth is required for tablet");
    }
  }

  double requiredNavigationRailWidth() {
    return navigationRailWidth!;
  }
}
