import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/data/fl_size.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_widget.dart';

class ResponsiveScaffold extends StatefulWidget {
  final Widget appBar;
  final Widget body;
  final Widget? footer;
  final Widget navigation;

  const ResponsiveScaffold({
    Key? key,
    required this.appBar,
    required this.body,
    this.footer,
    required this.navigation,
  }) : super(key: key);

  @override
  _ResponsiveScaffoldState createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  @override
  Widget build(BuildContext context) {
    developer.log('ScaffoldReponsive build', name: 'ScaffoldReponsive');
    Widget bodyWrapper;
    if (ResponsiveGuide.of(context).designInfo.margin is FlSizeNumber) {
      bodyWrapper = Container(
        alignment: Alignment.center,
        key: ValueKey(ResponsiveGuide.of(context).designInfo.deviceTarget),
        padding: EdgeInsets.symmetric(
            horizontal:
                (ResponsiveGuide.of(context).designInfo.margin as FlSizeNumber)
                    .number),
        child: widget.body,
      );
    } else {
      bodyWrapper = Center(
        key: ValueKey(ResponsiveGuide.of(context).designInfo.deviceTarget),
        child: Container(
          alignment: Alignment.center,
          child: widget.body,
          constraints: BoxConstraints(
              maxWidth:
                  (ResponsiveGuide.of(context).designInfo.body as FlSizeNumber)
                      .number),
        ),
      );
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          ResponsiveGuide.of(context).designInfo.appbarHeight +
              (ResponsiveGuide.of(context).designInfo.deviceTarget ==
                      DeviceTarget.desktop
                  ? 0
                  : kTextTabBarHeight),
        ),
        child: widget.appBar,
      ),
      drawer: ResponsiveGuide.of(context).designInfo.deviceTarget !=
              DeviceTarget.desktop
          ? Container(
              width: 279,
              child: widget.navigation,
            )
          : null,
      body: Row(
        children: [
          if (ResponsiveGuide.of(context).designInfo.deviceTarget ==
              DeviceTarget.desktop)
            Container(
              width: 279,
              child: widget.navigation,
            ),
          Expanded(child: bodyWrapper)
        ],
      ),
      bottomNavigationBar: widget.footer,
    );
  }
}
