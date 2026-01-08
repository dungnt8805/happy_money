import 'package:flutter/material.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/app/themes/spacing.dart';
import 'package:happy_money/app/utils/utils.dart';
import 'package:happy_money/presentation/features/app_root/constants/container_constants.dart';
import 'package:happy_money/presentation/widgets/bouncing.dart';
import 'package:happy_money/presentation/widgets/img.dart';
import 'package:happy_money/presentation/widgets/loading_indicator.dart';

class ContainerNavBarItem extends StatelessWidget {
  const ContainerNavBarItem({
    required this.indexTab,
    required this.selectedIndexTab,
    required this.icon,
    this.onTap,
    this.onDoubleTap,
    super.key,
  }) : _loadingNotifier = null;

  // Double to Refresh
  const ContainerNavBarItem.withRefresh({
    required this.indexTab,
    required this.selectedIndexTab,
    required this.icon,
    required ValueNotifier<bool> loadingNotifier,
    this.onTap,
    this.onDoubleTap,
    super.key,
  }) : _loadingNotifier = loadingNotifier;

  final RouteIdxTab indexTab;
  final RouteIdxTab selectedIndexTab;
  final String icon;
  final ValueChanged<RouteIdxTab>? onTap;
  final VoidCallback? onDoubleTap;

  final ValueNotifier<bool>? _loadingNotifier;

  @override
  Widget build(BuildContext context) {
    final isSelected = indexTab == selectedIndexTab;

    Widget child = Img.assetSvg(
      icon,
      width: 25,
      height: 25,
      colorFilter: ColorFilter.mode(
        isSelected ? AppPalette.primary : AppPalette.grey.shade500,
        BlendMode.srcIn,
      ),
    );

    if (_loadingNotifier != null) {
      child = ValueListenableBuilder<bool>(
        valueListenable: _loadingNotifier,
        builder: (context, isShow, child) {
          return AnimatedCrossFade(
            firstChild: child!,
            secondChild: const SizedBox(
              width: 25,
              height: 25,
              child: Indicator(radius: 12),
            ),
            crossFadeState: isShow
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: 300.ms,
          );
        },
        child: child,
      );
    }

    return Bouncing(
      scaleFactor: -0.5,
      behavior: HitTestBehavior.translucent,
      onTap: _handleOnTap,
      onDoubleTap: _handleOnDoubleTap,
      child: Padding(
        padding: const EdgeInsets.all(Insets.medium),
        child: child,
      ),
    );
  }

  void _handleOnTap() {
    if (_loadingNotifier?.value ?? false) return;

    onTap?.call(indexTab);
  }

  void _handleOnDoubleTap() {
    if (_loadingNotifier?.value ?? false) return;

    onDoubleTap?.call();
  }
}
