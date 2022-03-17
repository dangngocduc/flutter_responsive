import 'package:fl_responsive_guide/data/fl_design_config.dart';
import 'package:flutter/material.dart';

import 'responsive_guide_widget.dart';

typedef ResponsiveWidgetBuilder = Widget Function(
    BuildContext context, FlDesignConfig designInfo);

class ResponsiveGuideConsumerWidget extends StatefulWidget {
  final ResponsiveWidgetBuilder builder;
  const ResponsiveGuideConsumerWidget({Key? key, required this.builder})
      : super(key: key);

  @override
  _ResponsiveGuideConsumerWidgetState createState() =>
      _ResponsiveGuideConsumerWidgetState();
}

class _ResponsiveGuideConsumerWidgetState
    extends State<ResponsiveGuideConsumerWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      ResponsiveGuide.of(context).designInfo,
    );
  }
}
