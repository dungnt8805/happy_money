part of loading_indicator;

class AnimatedLoadingIndicator extends StatefulWidget {
  const AnimatedLoadingIndicator({
    required this.isLoading,
    this.color,
    this.radius,
    super.key,
  });

  final bool isLoading;
  final Color? color;
  final double? radius;

  @override
  State<AnimatedLoadingIndicator> createState() =>
      _AnimatedLoadingIndicatorState();
}

class _AnimatedLoadingIndicatorState extends State<AnimatedLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleFactor;

  bool _isShowIndicator = false;

  static final _oneToZeroTween = Tween<double>(begin: 1, end: 0);

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);

    if (widget.isLoading) _show();
  }

  @override
  void didUpdateWidget(covariant AnimatedLoadingIndicator oldWidget) {
    if (widget.isLoading != oldWidget.isLoading) {
      if (widget.isLoading) {
        _show();
      } else {
        _hide();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _show() {
    _scaleController.value = 0.0;
    setState(() {
      _isShowIndicator = true;
    });
  }

  Future<void> _hide() async {
    await _scaleController.animateTo(1, duration: 200.ms);

    setState(() {
      _isShowIndicator = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isShowIndicator) return const SizedBox.shrink();

    return ScaleTransition(
      scale: _scaleFactor,
      child: Indicator(
        color: widget.color,
        radius: widget.radius ?? 14,
      ),
    );
  }
}
