import 'package:flutter/material.dart';

extension SliverWidget on Widget {
  SliverToBoxAdapter toSliver({Key? key}) => SliverToBoxAdapter(key: key, child: this);

  SliverPadding toSliverWithPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    double? vertical,
    double? horizontal,
    Key? key,
  }) {
    return SliverPadding(
      key: key,
      padding: EdgeInsets.only(
        left: horizontal ?? left,
        top: vertical ?? top,
        right: horizontal ?? right,
        bottom: vertical ?? bottom,
      ),
      sliver: toSliver(),
    );
  }
}
