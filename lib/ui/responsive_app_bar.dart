import 'package:flutter/material.dart';

import 'responsive_guide_consumer_widget.dart';
import 'responsive_guide_widget.dart';

class ResponsiveAppBar extends StatefulWidget {
  final ResponsivePreferredSizeWidgetBuilder? tabBarBuilder;
  final Widget? leading;
  final List<Widget>? actions;
  final double? leadingWidth;

  const ResponsiveAppBar({
    Key? key,
    this.tabBarBuilder,
    this.leading,
    this.actions,
    this.leadingWidth,
  }) : super(key: key);

  @override
  _ResponsiveAppBarState createState() => _ResponsiveAppBarState();
}

class _ResponsiveAppBarState extends State<ResponsiveAppBar> {
  @override
  Widget build(BuildContext context) {
    final designInfo = ResponsiveGuide.of(context).designInfo;
    return AppBar(
      key: ValueKey(designInfo.deviceTarget),
      leading: widget.leading,
      actions: [
        if (widget.tabBarBuilder != null && designInfo.isDesktop)
          widget.tabBarBuilder!(context, designInfo),
        SizedBox(
          width: designInfo.gutters,
        ),
        if (widget.actions?.isNotEmpty == true) ...widget.actions!,
        SizedBox(
          width: designInfo.gutters,
        )
      ],
      leadingWidth: widget.leadingWidth,
      toolbarHeight: designInfo.appbarHeight,
      bottom: (designInfo.isDesktop)
          ? null
          : widget.tabBarBuilder!(context, designInfo),
    );
  }
}
