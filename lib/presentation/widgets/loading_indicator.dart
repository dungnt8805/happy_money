library loading_indicator;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/app/utils/utils.dart';

part 'animated_loading_cross_fade.dart';
part 'animated_loading_indicator.dart';
part 'bloc_loading_view.dart';
part 'loading_notifier.dart';
part 'positioned_loading_view.dart';

typedef LoadingIndicatorBuilder =
    Widget Function(BuildContext context, bool isLoading);

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    this.radius = 14,
    this.color,
  });

  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      radius: radius,
      color: color ?? context.appColors.primary,
    );
  }
}
