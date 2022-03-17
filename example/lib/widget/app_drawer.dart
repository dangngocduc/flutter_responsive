import 'dart:developer' as developer;
import 'package:example/gen/assets.gen.dart';
import 'package:fl_responsive_guide/data/fl_device_target.dart';
import 'package:fl_responsive_guide/ui/responsive_guide_consumer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  List menuItemGroup1 = [
    'Introduction',
    'Material studies',
  ];
  List menuItemGroup2 = [
    'Overview',
    'Enviroment',
    'Layout',
    'Navigation',
    'Color',
    'Typography',
    'Motion',
    'Shape',
  ];
  @override
  Widget build(BuildContext context) {
    return ResponsiveGuideConsumerWidget(
      builder: (context, designInfo) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (designInfo.deviceTarget != DeviceTarget.desktop)
                _DrawerHeader(),
              _GroupHeader(
                content: 'Material System',
              ),
              ...menuItemGroup1.map((e) => _MenuItem(
                    content: e,
                  )),
              Divider(
                color: Colors.black38,
                thickness: 0.5,
              ),
              _GroupHeader(
                content: 'Material Foundation',
              ),
              ...menuItemGroup2.map((e) => _MenuItem(
                    content: e,
                  )),
            ],
          ),
        );
      },
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: Divider.createBorderSide(
            context,
            width: 0.5,
            color: Colors.black38,
          ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icMaterialLogo.svg(width: 32),
          Gap(12),
          Text(
            'MATERIAL DESIGN',
            style: GoogleFonts.robotoMono()
                .copyWith(fontSize: 16, color: Colors.black),
          )
        ],
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final String content;

  const _GroupHeader({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      padding: EdgeInsets.only(left: 24, bottom: 12),
      alignment: Alignment.bottomLeft,
      child: Text(
        content,
        style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String content;

  const _MenuItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: EdgeInsets.only(left: 24),
      alignment: Alignment.centerLeft,
      child: Text(
        content,
        style: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
    );
  }
}
