import 'package:fl_responsive_guide/data/fl_design_config.dart';
import 'package:flutter/widgets.dart';

class ResponsiveGuide extends InheritedWidget {
  final FlDesignConfig designInfo;

  ResponsiveGuide({
    Key? key,
    required this.designInfo,
    required Widget child,
  }) : super(child: child, key: key);

  @override
  bool updateShouldNotify(covariant ResponsiveGuide oldWidget) {
    return oldWidget.designInfo.deviceTarget != designInfo.deviceTarget;
  }

  static ResponsiveGuide of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ResponsiveGuide>();
    if (result == null) throw "No ResponsiveGuideWidget found in context!";
    return result;
  }
}

class ResponsiveGuideWrapper extends StatefulWidget {
  final Widget child;
  final Map<double, FlDesignConfig> breakpointSystems;

  const ResponsiveGuideWrapper({
    Key? key,
    required this.breakpointSystems,
    required this.child,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ResponsiveGuideWrapperState();
  }
}

class _ResponsiveGuideWrapperState extends State<ResponsiveGuideWrapper> {
  late FlDesignConfig designInfo;

  UniqueKey key = UniqueKey();

  FlDesignConfig findFlDesignConfig(double width) {
    for (double key in widget.breakpointSystems.keys) {
      if (width > key) {
        continue;
      } else {
        return widget.breakpointSystems[key]!;
      }
    }
    return widget.breakpointSystems.values.last;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        designInfo = findFlDesignConfig(constraints.maxWidth);
        return ResponsiveGuide(
          key: key,
          child: widget.child,
          designInfo: designInfo,
        );
      },
    );
  }
}
