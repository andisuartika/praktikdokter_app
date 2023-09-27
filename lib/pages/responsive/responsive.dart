// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget tabletLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileLayout,
    required this.tabletLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        print('tablet');
        return tabletLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}
