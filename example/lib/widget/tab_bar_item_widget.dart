import 'package:flutter/material.dart';

class TabBarItemWidget extends StatefulWidget {
  final bool isSelected;

  final String label;

  final VoidCallback onTap;

  const TabBarItemWidget(
      {Key? key,
      required this.isSelected,
      required this.label,
      required this.onTap})
      : super(key: key);

  @override
  _TabBarItemWidgetState createState() => _TabBarItemWidgetState();
}

class _TabBarItemWidgetState extends State<TabBarItemWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isSelected ? null : widget.onTap,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: widget.isSelected
                ? Theme.of(context).tabBarTheme.labelStyle
                : Theme.of(context).tabBarTheme.unselectedLabelStyle,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: widget.isSelected
                  ? BorderSide(
                      width: widget.isSelected ? 4 : 0, color: Colors.white)
                  : BorderSide(color: Colors.transparent),
            ),
          )),
    );
  }
}
