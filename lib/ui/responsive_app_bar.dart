import 'package:flutter/material.dart';

import 'responsive_guide_consumer_widget.dart';
import 'responsive_guide_widget.dart';

class ResponsiveAppBar extends StatefulWidget {
  final ResponsiveWidgetBuilder builder;

  const ResponsiveAppBar({Key? key, required this.builder}) : super(key: key);

  @override
  _ResponsiveAppBarState createState() => _ResponsiveAppBarState();
}

class _ResponsiveAppBarState extends State<ResponsiveAppBar> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      ResponsiveGuide.of(context).designInfo,
    );
  }
}
