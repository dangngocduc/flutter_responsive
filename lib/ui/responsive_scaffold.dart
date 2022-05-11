import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:fl_responsive_guide/data/fl_size.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_widget.dart';

class ResponsiveScaffold extends StatefulWidget {
  final Widget appBar;
  final Widget body;
  final Widget? footer;
  final Widget navigation;
  final bool isSupportTabBar;

  const ResponsiveScaffold({
    Key? key,
    required this.appBar,
    required this.body,
    this.footer,
    this.isSupportTabBar = false,
    required this.navigation,
  }) : super(key: key);

  @override
  _ResponsiveScaffoldState createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  @override
  Widget build(BuildContext context) {
    Widget bodyWrapper;
    final designInfo = ResponsiveGuide.of(context).designInfo;
    if (designInfo.margin is FlSizeNumber) {
      bodyWrapper = Container(
        alignment: Alignment.center,
        key: ValueKey(designInfo.deviceTarget),
        padding: EdgeInsets.symmetric(
          horizontal: (designInfo.margin as FlSizeNumber).number,
        ),
        child: widget.body,
      );
    } else {
      bodyWrapper = Center(
        key: ValueKey(designInfo.deviceTarget),
        child: Container(
          alignment: Alignment.center,
          child: widget.body,
          constraints: BoxConstraints(
            maxWidth: (designInfo.body as FlSizeNumber).number,
          ),
        ),
      );
    }
    developer.log('designInfo.appbarHeight ${designInfo.appbarHeight}',
        name: 'ResponsiveScaffold');
    developer.log('designInfo.tabBarHeight ${designInfo.tabBarHeight}',
        name: 'ResponsiveScaffold');
    developer.log(
        'Height : ${designInfo.appbarHeight + (designInfo.isDesktop ? 0 : (widget.isSupportTabBar ? designInfo.tabBarHeight : 0))}',
        name: 'ResponsiveScaffold');
    return Scaffold(
      appBar: PreferredSize(
        key: ValueKey(designInfo.deviceTarget),
        preferredSize: Size.fromHeight(
          designInfo.appbarHeight +
              (designInfo.isDesktop
                  ? 0
                  : (widget.isSupportTabBar ? designInfo.tabBarHeight : 0)),
        ),
        child: widget.appBar,
      ),
      drawer: !designInfo.isDesktop
          ? Container(
              alignment: Alignment.topCenter,
              width: designInfo.drawerWidth,
              child: widget.navigation,
            )
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (designInfo.isDesktop)
            Container(
              width: designInfo.drawerWidth,
              child: widget.navigation,
            ),
          Expanded(child: bodyWrapper)
        ],
      ),
      bottomNavigationBar: widget.footer,
    );
  }
}
