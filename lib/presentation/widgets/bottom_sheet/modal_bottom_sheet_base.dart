import 'package:flutter/material.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/app/utils/utils.dart';

const double _defaultScrollControlDisabledMaxHeightRatio = 9.0 / 16.0;

Future<T?> showModalBottomSheetBase<T>(
  BuildContext context, {
  required WidgetBuilder builder,
  double? height,
  Widget? leading,
  Widget? trailing,
  EdgeInsetsGeometry? dragHandlePadding,
  Color? backgroundColor,
  Color? barrierColor,
  String? barrierLabel,
  Clip? clipBehavior,
  Offset? anchorPoint,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
  double? scrollControlDisabledMaxHeightRatio,
  bool? enableDrag,
  bool? useSafeArea,
  bool? isDismissible,
  bool? isScrollControlled,
  bool useRootNavigator = false,
}) async {
  assert(debugCheckHasMediaQuery(context), '');
  assert(debugCheckHasMaterialLocalizations(context), '');

  final NavigatorState navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return navigator.push(ModalBottomSheetBaseRoute<T>(
    builder: builder,
    capturedThemes: InheritedTheme.capture(from: context, to: navigator.context),
    scrollControlDisabledMaxHeightRatio: scrollControlDisabledMaxHeightRatio,
    barrierLabel: barrierLabel ?? localizations.scrimLabel,
    barrierOnTapHint: localizations.scrimOnTapHint(localizations.bottomSheetLabel),
    backgroundColor: backgroundColor,
    clipBehavior: clipBehavior,
    modalBarrierColor: barrierColor ?? Theme.of(context).bottomSheetTheme.modalBarrierColor,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
    anchorPoint: anchorPoint,
    enableDrag: enableDrag,
    useSafeArea: useSafeArea,
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    height: height,
    leading: leading,
    trailing: trailing,
    dragHandlePadding: dragHandlePadding,
  ));
}

class ModalBottomSheetBaseRoute<T> extends ModalBottomSheetRoute<T> {
  ModalBottomSheetBaseRoute({
    required WidgetBuilder builder,
    super.capturedThemes,
    super.barrierLabel,
    super.barrierOnTapHint,
    super.backgroundColor,
    super.elevation,
    super.shape,
    super.clipBehavior,
    super.constraints,
    super.modalBarrierColor,
    super.transitionAnimationController,
    super.anchorPoint,
    bool? enableDrag,
    bool? useSafeArea,
    bool? isDismissible,
    bool? isScrollControlled,
    double? scrollControlDisabledMaxHeightRatio,
    RouteSettings? routeSettings,
    double? height,
    Widget? leading,
    Widget? trailing,
    EdgeInsetsGeometry? dragHandlePadding,
  }) : super(
          settings: routeSettings ?? const RouteSettings(name: 'ModalBottomSheetBaseRoute'),
          scrollControlDisabledMaxHeightRatio:
              scrollControlDisabledMaxHeightRatio ?? _defaultScrollControlDisabledMaxHeightRatio,
          enableDrag: enableDrag ?? true,
          useSafeArea: useSafeArea ?? false,
          isDismissible: isDismissible ?? true,
          isScrollControlled: isScrollControlled ?? true,
          showDragHandle: false,
          builder: (_) => _BottomSheetBuilderBase(
            builder: builder,
            height: height,
            leading: leading,
            trailing: trailing,
            backgroundColor: backgroundColor,
            dragHandlePadding: dragHandlePadding,
          ),
        );
}

class _BottomSheetBuilderBase extends StatefulWidget {
  const _BottomSheetBuilderBase({
    required this.builder,
    this.backgroundColor,
    this.height,
    this.leading,
    this.trailing,
    this.dragHandlePadding,
  });

  final WidgetBuilder builder;
  final Color? backgroundColor;
  final double? height;
  final Widget? leading;
  final Widget? trailing;
  final EdgeInsetsGeometry? dragHandlePadding;

  @override
  State<_BottomSheetBuilderBase> createState() => _BottomSheetBuilderBaseState();
}

class _BottomSheetBuilderBaseState extends State<_BottomSheetBuilderBase> {
  @override
  Widget build(BuildContext context) {
    final sheetTheme = Theme.of(context).bottomSheetTheme;

    final dragHandleSize = sheetTheme.dragHandleSize;
    final dragHandleColor = sheetTheme.dragHandleColor;
    final backgroundColor = widget.backgroundColor ?? sheetTheme.backgroundColor ?? AppPalette.bgrDark;

    return Container(
      height: widget.height,
      color: backgroundColor,
      constraints: BoxConstraints(maxHeight: 100.h - Responsive.safeArea.top - kToolbarHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTitle(
                widget: widget.leading,
                alignment: Alignment.centerLeft,
              ),
              if (dragHandleSize != null)
                Container(
                  width: dragHandleSize.width,
                  height: dragHandleSize.height,
                  alignment: Alignment.center,
                  margin: widget.dragHandlePadding ?? const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: dragHandleColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              _buildTitle(
                widget: widget.trailing,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
          Flexible(
            child: SizedBox(
              height: widget.height,
              child: widget.builder(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle({
    required Widget? widget,
    required Alignment alignment,
  }) {
    if (widget == null) return const Expanded(child: SizedBox.shrink());

    return Expanded(
      child: Align(
        alignment: alignment,
        child: widget,
      ),
    );
  }
}
