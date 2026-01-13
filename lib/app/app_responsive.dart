 
import 'package:flutter/material.dart';
import 'package:happy_money/app/utils/utils.dart';

class AppResponsive extends StatelessWidget {
    const AppResponsive({
      required this.child,
      super.key,
    });

    final Widget child;

    @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              Responsive.setResponsive(context, constraints, orientation);
              return child;
            },
          );
        },
      );
    }
  }