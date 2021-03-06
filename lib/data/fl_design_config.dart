import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/data/fl_size.dart';
import 'package:flutter/material.dart';

const kResponsiveDrawerWidth = 279.0;
const kResponsiveToolBarHeight = 48.0;
const kResponsiveGutterMobile = 12.0;

class FlDesignConfig {
  final FlSize margin;
  final FlSize body;
  final int layoutColumns;
  final double gutters;
  final DeviceTarget deviceTarget;
  final double? navigationRailWidth;
  final double appbarHeight;
  final double drawerWidth;
  final double tabBarHeight;
  final Size size;

  FlDesignConfig(
      {required this.margin,
      required this.body,
      required this.deviceTarget,
      this.size = Size.infinite,
      this.navigationRailWidth,
      this.appbarHeight = kResponsiveToolBarHeight,
      this.layoutColumns = 1,
      this.drawerWidth = kResponsiveDrawerWidth,
      this.tabBarHeight = kTextTabBarHeight,
      this.gutters = kResponsiveGutterMobile}) {
    assert(body is FlSizeNumber || margin is FlSizeNumber,
        "Required at least body or margin is number");
  }

  bool get isDesktop => deviceTarget == DeviceTarget.desktop;

  bool get isTablet => deviceTarget == DeviceTarget.tablet;

  bool get isMobile => deviceTarget == DeviceTarget.mobile;

  double requiredNavigationRailWidth() {
    return navigationRailWidth!;
  }

  FlDesignConfig copyWith({Size? size}) {
    return FlDesignConfig(
      margin: this.margin,
      body: this.body,
      deviceTarget: this.deviceTarget,
      size: size ?? Size.infinite,
      navigationRailWidth: this.navigationRailWidth,
      appbarHeight: this.appbarHeight,
      layoutColumns: this.layoutColumns,
      drawerWidth: this.drawerWidth,
      tabBarHeight: this.tabBarHeight,
      gutters: this.gutters,
    );
  }
}
