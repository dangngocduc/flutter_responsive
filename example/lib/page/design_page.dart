import 'dart:developer' as developer;
import 'package:example/gen/assets.gen.dart';
import 'package:example/widget/tab_bar_item_widget.dart';
import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/ui/responsive_app_bar.dart';
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
      body: Container(),
      navigation: AppDrawer(),
    );
  }
}
