import 'package:example/widget/app_drawer.dart';
import 'package:example/widget/main_app_bar.dart';
import 'package:fl_responsive_guide/ui/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class DevelopPage extends StatefulWidget {
  const DevelopPage({Key? key}) : super(key: key);

  @override
  _DevelopPageState createState() => _DevelopPageState();
}

class _DevelopPageState extends State<DevelopPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      appBar: MainAppBar(
        indexTab: 2,
      ),
      body: Container(),
      isSupportTabBar: true,
      navigation: AppDrawer(),
    );
  }
}
