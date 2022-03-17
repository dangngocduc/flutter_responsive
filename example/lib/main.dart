import 'package:fl_responsive_guide/data/fl_design_config.dart';
import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/data/fl_size.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_widget.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'home_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveGuideWrapper(
      breakpointSystems: {
        600: FlDesignConfig(
            body: FlSize.scale(),
            margin: FlSize.size(0),
            layoutColumns: 1,
            deviceTarget: DeviceTarget.mobile),
        900: FlDesignConfig(
            body: FlSize.scale(),
            margin: FlSize.size(0),
            gutters: 12,
            navigationRailWidth: 80,
            deviceTarget: DeviceTarget.tablet),
        double.maxFinite: FlDesignConfig(
            body: FlSize.size(621),
            margin: FlSize.scale(),
            gutters: 12,
            layoutColumns: 3,
            appbarHeight: 72,
            deviceTarget: DeviceTarget.desktop)
      },
      child: Application(),
    );
  }
}
