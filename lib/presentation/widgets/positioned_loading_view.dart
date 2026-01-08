part of loading_indicator;

class PositionedLoadingView extends StatelessWidget {
  const PositionedLoadingView({
    required this.isLoading,
    this.builder,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.alignment,
    super.key,
  });

  final LoadingIndicatorBuilder? builder;

  final bool isLoading;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child:
          builder?.call(context, isLoading) ??
          AnimatedLoadingCrossFade(
            isLoading: isLoading,
            radius: radius,
            width: width,
            height: height,
            color: color,
            backgroundColor: backgroundColor,
            alignment: alignment,
          ),
    );
  }
}
