import 'dart:developer' as developer;
import 'package:example/gen/assets.gen.dart';
import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/ui/responsive_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'tab_bar_item_widget.dart';

class MainAppBar extends StatefulWidget {
  final int indexTab;

  const MainAppBar({Key? key, required this.indexTab}) : super(key: key);

  @override
  _MainAppBarState createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveAppBar(
      builder: (context, designInfo) {
        final tabItems = [
          TabBarItemWidget(
            isSelected: widget.indexTab == 0,
            label: 'Design',
            onTap: () {
              GoRouter.of(context).go('/design');
            },
          ),
          TabBarItemWidget(
            isSelected: widget.indexTab == 1,
            label: 'Components',
            onTap: () {
              GoRouter.of(context).go('/component');
            },
          ),
          TabBarItemWidget(
            isSelected: widget.indexTab == 2,
            label: 'Develop',
            onTap: () {
              GoRouter.of(context).go('/develop');
            },
          ),
          TabBarItemWidget(
            isSelected: widget.indexTab == 3,
            label: 'Blog',
            onTap: () {
              GoRouter.of(context).go('/blog');
            },
          ),
        ];
        return AppBar(
          toolbarHeight: designInfo.appbarHeight,
          leadingWidth: 96,
          leading: Builder(
            builder: (context) {
              final bool hasDrawer = Scaffold.of(context).hasDrawer;
              return Row(
                children: [
                  if (hasDrawer)
                    IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu)),
                  Container(
                    width: 48,
                    child: Assets.icMaterialLogo.svg(width: 32),
                  )
                ],
              );
            },
          ),
          actions: [
            if (designInfo.deviceTarget == DeviceTarget.desktop)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: tabItems,
              ),
            const SizedBox(
              width: 16,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            const SizedBox(
              width: 16,
            )
          ],
          bottom: (designInfo.deviceTarget != DeviceTarget.desktop)
              ? PreferredSize(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: tabItems,
                  ),
                  preferredSize: Size.fromHeight(kTextTabBarHeight))
              : null,
        );
      },
    );
  }
}
