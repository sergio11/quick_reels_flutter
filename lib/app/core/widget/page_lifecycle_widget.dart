import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

typedef PageLifecycleStateChangedCallback = void Function(bool appeared);

enum PageLifecycleDisappearCondition {
  appInactive,
  appPaused,
}

class PageLifecycleConfig {

  static Duration get detectionInterval =>
      VisibilityDetectorController.instance.updateInterval;
  static set detectionInterval(Duration value) =>
      VisibilityDetectorController.instance.updateInterval = value;

  static final Set<PageLifecycleDisappearCondition> disappearWhen = {
    PageLifecycleDisappearCondition.appInactive,
    PageLifecycleDisappearCondition.appPaused,
  };
}

class PageLifecycle extends StatefulWidget {

  final PageLifecycleStateChangedCallback stateChanged;

  final Widget? child;

  final Set<PageLifecycleDisappearCondition>? disappearWhen;

  const PageLifecycle(
      {super.key, required this.stateChanged, this.disappearWhen, this.child});

  @override
  State<PageLifecycle> createState() => _PageLifecycleState();
}

class _PageLifecycleState extends State<PageLifecycle>
    with WidgetsBindingObserver {
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.inactive:
        if (_markDisappearWhen(PageLifecycleDisappearCondition.appInactive)) {
          _updateAppearanceStateIfNeeded(false);
        }
        break;
      case AppLifecycleState.paused:
        if (_markDisappearWhen(PageLifecycleDisappearCondition.appPaused)) {
          _updateAppearanceStateIfNeeded(false);
        }
        break;
      case AppLifecycleState.resumed:
        final newValue = _visibleFraction != 0;
        _updateAppearanceStateIfNeeded(newValue);
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  bool _appeared = false;
  double _visibleFraction = 0;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _key,
      onVisibilityChanged: (visibilityInfo) {
        _visibleFraction = visibilityInfo.visibleFraction;
        final newValue = _visibleFraction != 0;
        _updateAppearanceStateIfNeeded(newValue);
      },
      child: widget.child ?? Container(),
    );
  }

  void _updateAppearanceStateIfNeeded(bool newValue) {
    if (_appeared == newValue) {
      return;
    }
    _appeared = newValue;
    widget.stateChanged(_appeared);
  }

  bool _markDisappearWhen(PageLifecycleDisappearCondition condition) {
    final situations =
        widget.disappearWhen ?? PageLifecycleConfig.disappearWhen;
    return situations.contains(condition);
  }
}