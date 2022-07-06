import 'package:example/widget/app_drawer.dart';
import 'package:example/widget/main_app_bar.dart';
import 'package:fl_responsive_guide/ui/responsive_scaffold.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {

  late Future future;

  @override
  void initState() {
    super.initState();
    future = Future.delayed(...);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: builder,
    );
  }
}
