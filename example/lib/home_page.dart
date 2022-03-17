import 'package:fl_responsive_guide/data/fl_design_config.dart';
import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/ui/responsive_app_bar.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_widget.dart';
import 'package:fl_responsive_guide/ui/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: ResponsiveAppBar(
        builder: (BuildContext context, FlDesignConfig designInfo) {
          return Container();
        },
      ),
      body: Container(
        color: ResponsiveGuide.of(context).designInfo.deviceTarget ==
                DeviceTarget.mobile
            ? Colors.amber
            : Colors.cyan,
      ),
      navigation: Container(
        color: Colors.blue,
      ),
    );
  }
}
