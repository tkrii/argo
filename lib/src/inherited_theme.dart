import 'package:argo/argo.dart'
    show ArgoVariant, argoHighContrastDark, argoHighContrastLight;
import 'package:collection/collection.dart' show IterableEquality;
import 'package:flutter/foundation.dart'
    show
        DiagnosticPropertiesBuilder,
        Diagnosticable,
        DiagnosticsProperty,
        IterableProperty;
import 'package:flutter/material.dart';
import 'package:platform/platform.dart' show Platform;

/// Applies Argo theme to descendant widgets.
///
/// Descendant widgets obtain the current theme's [ArgoThemeData] object using
/// [ArgoTheme.of]. When a widget uses [ArgoTheme.of], it is automatically
/// rebuilt if the theme later changes, so that the changes can be applied.
///
/// There are two ways to use [ArgoTheme] - with a child widget or as a builder.
///
/// ### Child widget
///
/// The simplest way to use [ArgoTheme] is to wrap a child widget in it.
///
/// ```dart
/// MaterialApp(
///   home: ArgoTheme(
///     child: ...
///   ),
/// )
/// ```
///
/// **Note**: [ArgoTheme] must be a _descendant_ of [MaterialApp] to avoid that
/// [MaterialApp] overrides [ArgoTheme].
///
/// When used like this, [ArgoTheme] internally creates an [AnimatedTheme]
/// widget populated with the appropriate Argo theme data. Moreover, The child
/// widget gets automatically rebuilt whenever the system theme changes.
///
/// ### Builder
///
/// An alternative way to use [ArgoTheme] is to use it as a builder.
///
/// ```dart
/// ArgoTheme(
///   builder: (context, argo, child) {
///     return MaterialApp(
///       theme: argo.theme,
///       darkTheme: argo.darkTheme,
///       home: ...
///     );
///   },
/// )
/// ```
///
/// When used like this, [ArgoTheme] does not create an [AnimatedTheme] widget.
/// Instead, it passes a [ArgoThemeData] object to the [builder] function to
/// allow passing the desired values to [MaterialApp]. This has the advantage
/// that any widget created by [MaterialApp], such as the built-in [Navigator],
/// gains Argo-theme as well.
///
/// ### Theme data overrides
///
/// The [data] property can be used to override parts of the default theme data.
/// For example, the following code overrides the default page transitions and
/// visual density:
///
/// ```dart
/// ArgoTheme(
///   data: ArgoThemeData(
///    pageTransitionsTheme: PageTransitionsTheme(/*...*/),
///    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
///  ),
///   builder: (context, argo, child) {
///     return MaterialApp(
///       theme: argo.theme,
///       darkTheme: argo.darkTheme,
///       home: ...
///     );
///   },
/// )
/// ```
///
/// See also:
///  * [ArgoThemeData]
class ArgoTheme extends StatefulWidget {
  /// Applies the given theme [data] to [child].
  ///
  /// The [data] and [child] arguments must not be null.
  const ArgoTheme({
    super.key,
    this.builder,
    this.child,
    this.data = const ArgoThemeData(),
    @visibleForTesting Platform? platform,
  }) : assert(
          builder != null || child != null,
          'Either builder or child must be provided',
        );

  /// Builds the widget below this widget in the tree.
  final ValueWidgetBuilder<ArgoThemeData>? builder;

  /// The widget below this widget in the tree.
  final Widget? child;

  /// Specifies the theme for descendant widgets.
  final ArgoThemeData data;

  /// The data from the closest [ArgoTheme] instance that encloses the given
  /// context.
  static ArgoThemeData of(BuildContext context) => maybeOf(context)!;

  /// An optional data from the closest [ArgoTheme] instance that encloses the
  /// given context or `null` if there is no such ancestor.
  static ArgoThemeData? maybeOf(BuildContext context) {
    final theme =
        context.dependOnInheritedWidgetOfExactType<_ArgoInheritedTheme>();
    return theme?.data;
  }

  @override
  State<ArgoTheme> createState() => _ArgoThemeState();
}

class _ArgoThemeState extends State<ArgoTheme> {
  ArgoVariant? _variant;
  ArgoVariant? resolveVariant(String? name) {
    if (name?.endsWith('-dark') == true) {
      name = name!.substring(0, name.length - 5);
    }
    if (name?.startsWith('Argo-') == true) {
      name = name!.substring(5);
    }
    if (name == 'Argo') {
      return ArgoVariant.blue;
    }
    for (final value in ArgoVariant.values) {
      if (value.name.toLowerCase() == name?.toLowerCase()) {
        return value;
      }
    }
    return null;
  }

  ThemeMode resolveMode() {
    final mode = widget.data.themeMode ?? ThemeMode.system;
    if (mode == ThemeMode.system) {
      return MediaQuery.platformBrightnessOf(context) == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;
    }
    return mode;
  }

  ArgoThemeData resolveData() {
    return widget.data.copyWith(
      variant: widget.data.variant ?? _variant,
      highContrast:
          widget.data.highContrast ?? MediaQuery.highContrastOf(context),
      themeMode: resolveMode(),
    );
  }

  ThemeData resolveTheme(ArgoThemeData data) {
    final dark = data.themeMode == ThemeMode.dark;

    if (data.highContrast!) {
      return dark ? argoHighContrastDark : argoHighContrastLight;
    }

    final variant = data.variant ?? ArgoVariant.blue;
    return (dark ? variant.darkTheme : variant.theme).overrideWith(data);
  }

  @override
  Widget build(BuildContext context) {
    final data = resolveData();
    return _ArgoInheritedTheme(
      data: data,
      child: widget.builder?.call(context, data, widget.child) ??
          AnimatedTheme(
            data: resolveTheme(data),
            child: widget.child!,
          ),
    );
  }
}

@immutable
class ArgoThemeData with Diagnosticable {
  const ArgoThemeData({
    this.variant,
    this.highContrast,
    this.themeMode,
    this.extensions,
    this.pageTransitionsTheme,
    this.useMaterial3,
    this.visualDensity,
  });

  /// Specifies the theme variant.
  final ArgoVariant? variant;

  /// Whether to use high contrast colors.
  final bool? highContrast;

  /// Whether a light or dark theme is used.
  final ThemeMode? themeMode;

  /// Overrides [ThemeData.extensions].
  final Iterable<ThemeExtension<dynamic>>? extensions;

  /// Overrides [ThemeData.pageTransitionsTheme].
  final PageTransitionsTheme? pageTransitionsTheme;

  /// Overrides [ThemeData.useMaterial3].
  final bool? useMaterial3;

  /// Overrides [ThemeData.visualDensity].
  final VisualDensity? visualDensity;

  /// The light theme of [variant] (or [argoLight] if not available) merged with
  /// the `ArgoThemeData` overrides.
  ThemeData? get theme =>
      (variant?.theme ?? ArgoVariant.blue.theme).overrideWith(this);

  /// The dark theme of [variant] (or [argoDark] if not available) merged with
  /// the `ArgoThemeData` overrides.
  ThemeData? get darkTheme =>
      (variant?.darkTheme ?? ArgoVariant.blue.darkTheme).overrideWith(this);

  /// Creates a copy of this [ArgoThemeData] with the provided values.
  ArgoThemeData copyWith({
    ArgoVariant? variant,
    bool? highContrast,
    ThemeMode? themeMode,
    Iterable<ThemeExtension<dynamic>>? extensions,
    PageTransitionsTheme? pageTransitionsTheme,
    bool? useMaterial3,
    VisualDensity? visualDensity,
  }) {
    return ArgoThemeData(
      variant: variant ?? this.variant,
      highContrast: highContrast ?? this.highContrast,
      themeMode: themeMode ?? this.themeMode,
      extensions: extensions ?? this.extensions,
      pageTransitionsTheme: pageTransitionsTheme ?? this.pageTransitionsTheme,
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      visualDensity: visualDensity ?? this.visualDensity,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ArgoVariant>('variant', variant));
    properties.add(DiagnosticsProperty<bool>('highContrast', highContrast));
    properties.add(DiagnosticsProperty<ThemeMode>('themeMode', themeMode));
    properties.add(IterableProperty('extensions', extensions));
    properties
        .add(DiagnosticsProperty('pageTransitionsTheme', pageTransitionsTheme));
    properties.add(DiagnosticsProperty('useMaterial3', useMaterial3));
    properties.add(DiagnosticsProperty('visualDensity', visualDensity));
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final iterableEquals = const IterableEquality().equals;
    return other is ArgoThemeData &&
        other.variant == variant &&
        other.highContrast == highContrast &&
        other.themeMode == themeMode &&
        iterableEquals(other.extensions, extensions) &&
        other.pageTransitionsTheme == pageTransitionsTheme &&
        other.useMaterial3 == useMaterial3 &&
        other.visualDensity == visualDensity;
  }

  @override
  int get hashCode {
    return Object.hash(
      variant,
      highContrast,
      themeMode,
      extensions,
      pageTransitionsTheme,
      useMaterial3,
      visualDensity,
    );
  }
}

class _ArgoInheritedTheme extends InheritedTheme {
  const _ArgoInheritedTheme({
    required this.data,
    required super.child,
  });

  final ArgoThemeData? data;

  @override
  bool updateShouldNotify(covariant _ArgoInheritedTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _ArgoInheritedTheme(data: data, child: child);
  }
}

extension _ArgoThemeDataX on ThemeData {
  ThemeData overrideWith(ArgoThemeData data) {
    return copyWith(
      extensions: data.extensions,
      pageTransitionsTheme: data.pageTransitionsTheme,
      visualDensity: data.visualDensity,
    );
  }
}
