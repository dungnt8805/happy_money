part of loading_indicator;

class LoadingNotifier extends StatelessWidget {
  const LoadingNotifier({
    required this.isLoadingNotifier,
    this.builder,
    this.width,
    this.height,
    this.radius = 14,
    this.color,
    this.backgroundColor,
    this.alignment,
    super.key,
  });

  final ValueNotifier<bool> isLoadingNotifier;
  final LoadingIndicatorBuilder? builder;

  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final Color? backgroundColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoadingNotifier,
      builder: (context, isLoading, child) {
        if (builder != null) return builder!.call(context, isLoading);

        return AnimatedLoadingCrossFade(
          isLoading: isLoading,
          radius: radius,
          width: width,
          height: height,
          color: color,
          backgroundColor: backgroundColor,
          alignment: alignment,
        );
      },
    );
  }
}
