import 'dart:developer' as developer;
import 'package:fl_responsive_guide/fl_responsive_guide.dart';
import 'package:flutter/material.dart';

class ResponsiveBody extends StatelessWidget {
  final WidgetBuilder builder;
  const ResponsiveBody({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final designInfo = ResponsiveGuide.of(context).designInfo;
    if (designInfo.body is FlSizeNumber) {
      return Container(
        width: (designInfo.body as FlSizeNumber).number,
        child: builder(context),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: (designInfo.margin as FlSizeNumber).number),
        child: builder(context),
      );
    }
  }
}
