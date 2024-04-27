import 'package:flutter/material.dart';

class ArgoPageTransitionsTheme extends PageTransitionsTheme {
  const ArgoPageTransitionsTheme._({required super.builders});

  /// Horizontal slide and fade page transitions.
  ///
  /// This page transitions theme is best suited for applications using a
  /// horizontal navigation pattern, such as classic desktop wizards or master-
  /// detail applications in portrait mode.
  static const horizontal = ArgoPageTransitionsTheme._(
    builders: {
      TargetPlatform.linux: _horizontalBuilder,
      TargetPlatform.macOS: _horizontalBuilder,
      TargetPlatform.windows: _horizontalBuilder,
    },
  );

  /// Vertical slide and fade page transitions.
  ///
  /// This page transitions theme is best suited for applications using a
  /// vertical navigation pattern, such as master-detail applications in
  /// landscape mode.
  static const vertical = ArgoPageTransitionsTheme._(
    builders: {
      TargetPlatform.linux: _verticalBuilder,
      TargetPlatform.macOS: _verticalBuilder,
      TargetPlatform.windows: _verticalBuilder,
    },
  );

  static const _horizontalBuilder = _ArgoHorizontalPageTransitionsBuilder();
  static const _verticalBuilder = _ArgoVerticalPageTransitionsBuilder();
}

class _ArgoHorizontalPageTransitionsBuilder extends PageTransitionsBuilder {
  const _ArgoHorizontalPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _ArgoHorizontalPageTransitions(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class _ArgoHorizontalPageTransitions extends StatelessWidget {
  _ArgoHorizontalPageTransitions({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required this.child,
  })  : _position = animation.drive(_tween.chain(_fastOutSlowInTween)),
        _secondaryPosition = secondaryAnimation
            .drive(_secondaryTween.chain(_fastOutSlowInTween)),
        _opacity = animation.drive(_easeInTween),
        _secondaryOpacity = secondaryAnimation.drive(_easeInTween);

  static final _tween = Tween(begin: const Offset(0.2, 0.0), end: Offset.zero);
  static final _secondaryTween =
      Tween(begin: Offset.zero, end: const Offset(-0.2, 0.0));
  static final _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);

  final Animation<Offset> _position, _secondaryPosition;
  final Animation<double> _opacity, _secondaryOpacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    return SlideTransition(
      position: _secondaryPosition,
      textDirection: textDirection,
      child: FadeTransition(
        opacity: ReverseAnimation(_secondaryOpacity),
        child: SlideTransition(
          position: _position,
          textDirection: textDirection,
          child: FadeTransition(opacity: _opacity, child: child),
        ),
      ),
    );
  }
}

class _ArgoVerticalPageTransitionsBuilder extends PageTransitionsBuilder {
  const _ArgoVerticalPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return _ArgoVerticalPageTransitions(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      child: child,
    );
  }
}

class _ArgoVerticalPageTransitions extends StatelessWidget {
  _ArgoVerticalPageTransitions({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required this.child,
  })  : _position = animation.drive(_tween.chain(_fastOutSlowInTween)),
        _secondaryPosition = secondaryAnimation
            .drive(_secondaryTween.chain(_fastOutSlowInTween)),
        _opacity = animation.drive(_easeInTween),
        _secondaryOpacity = secondaryAnimation.drive(_easeOutTween);

  static final _tween = Tween(begin: const Offset(0.0, 0.1), end: Offset.zero);
  static final _secondaryTween =
      Tween(begin: Offset.zero, end: const Offset(0.0, 0.0));
  static final _fastOutSlowInTween = CurveTween(curve: Curves.fastOutSlowIn);
  static final _easeInTween = CurveTween(curve: Curves.easeIn);
  static final _easeOutTween = CurveTween(curve: Curves.easeOutExpo);

  final Animation<Offset> _position, _secondaryPosition;
  final Animation<double> _opacity, _secondaryOpacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final textDirection = Directionality.of(context);
    return SlideTransition(
      position: _secondaryPosition,
      textDirection: textDirection,
      child: FadeTransition(
        opacity: ReverseAnimation(_secondaryOpacity),
        child: SlideTransition(
          position: _position,
          textDirection: textDirection,
          child: FadeTransition(opacity: _opacity, child: child),
        ),
      ),
    );
  }
}
