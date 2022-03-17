import 'package:example/widget/main_app_bar.dart';
import 'package:fl_responsive_guide/ui/responsive_scaffold.dart';
import 'package:flutter/material.dart';

import '../widget/app_drawer.dart';

class ComponentPage extends StatefulWidget {
  const ComponentPage({Key? key}) : super(key: key);

  @override
  _ComponentPageState createState() => _ComponentPageState();
}

class _ComponentPageState extends State<ComponentPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: MainAppBar(
        indexTab: 1,
      ),
      body: Container(),
      isSupportTabBar: true,
      navigation: AppDrawer(),
    );
  }
}
