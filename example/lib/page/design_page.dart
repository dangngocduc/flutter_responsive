import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_consumer_widget.dart';
import 'package:fl_responsive_guide/ui/responsive_scaffold.dart';
import 'package:flutter/material.dart';

import '../widget/app_drawer.dart';
import '../widget/main_app_bar.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({Key? key}) : super(key: key);

  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: MainAppBar(
        indexTab: 0,
      ),
      isSupportTabBar: true,
      body: ResponsiveGuideConsumerWidget(
        builder: (context, designInfo) {
          switch (designInfo.deviceTarget) {
            case DeviceTarget.mobile:
              return Center(
                child: Text('Mobile App'),
              );
            case DeviceTarget.tablet:
              return Center(
                child: Text('Tablet App'),
              );
            case DeviceTarget.desktop:
              return Center(
                child: Text('Desktop App'),
              );
          }
        },
      ),
      navigation: AppDrawer(),
    );
  }
}
