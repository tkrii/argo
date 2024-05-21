import 'package:argo/argo.dart';
import 'package:flutter/material.dart';

const _gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 300,
  mainAxisExtent: 40,
  mainAxisSpacing: 20,
  crossAxisSpacing: 20,
);

class ColorsView extends StatelessWidget {
  const ColorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accentColors = _getAccentColors(theme);
    final baseColors = _getBaseColors(theme);
    final specialColors = _getSpecialColors(theme);

    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        ..._themeSection(
          theme: theme,
          colors: accentColors,
          headline: 'Theme Accent Colors',
        ),
        ..._themeSection(
          theme: theme,
          colors: baseColors,
          headline: 'Theme Base Colors',
        ),
        ..._themeSection(
          theme: theme,
          colors: specialColors,
          headline: 'Theme Special Colors',
        ),
        ..._themeSection(
          theme: theme,
          colors: _getArgoPrimaryColors(theme),
          headline: 'Primary Color Argo Variations',
        ),
      ],
    );
  }

  List<Widget> _themeSection({
    required ThemeData theme,
    required Map<String, (Color, Color?)> colors,
    required String headline,
  }) {
    final headlineStyle = theme.textTheme.headlineMedium;

    return [
      Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 5),
        child: Text(
          headline,
          style: headlineStyle,
        ),
      ),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: _gridDelegate,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final e = colors.entries.elementAt(index);
          return _colorContainer(
            e.key,
            e.value.$1,
          );
        },
      ),
      const _SpacedDivider(),
    ];
  }

  Widget _colorContainer(
    String colorName,
    Color backgroundColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 1),
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              colorName,
              style: TextStyle(
                color: (backgroundColor).foreground,
                fontSize: 12,
              ),
            ),
            Text(
              (Color(backgroundColor.value)).toString().replaceAll('Color(0x', '#').replaceAll(')', ''),
              style: TextStyle(
                color: (backgroundColor).foreground.scale(alpha: -0.2),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SpacedDivider extends StatelessWidget {
  const _SpacedDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30, bottom: 20),
      child: Divider(
        height: 0,
      ),
    );
  }
}

Map<String, (Color, Color?)> _getSpecialColors(ThemeData theme) {
  final s = theme.colorScheme;

  final colors = <String, (Color, Color?)>{
    'error': (s.error, null),
    'onError': (s.onError, null),
    'shadow': (s.shadow, null),
    'scrim': (s.scrim, null),
    'link': (s.link, null),
    'success': (s.success, null),
    'warning': (s.warning, null),
    'destructive': (s.destructive, null),
  };
  return colors;
}

Map<String, (Color, Color?)> _getAccentColors(ThemeData theme) {
  final s = theme.colorScheme;

  final colors = <String, (Color, Color?)>{
    'inversePrimary': (s.inversePrimary, null),
    'primary': (s.primary, null),
    'onPrimary': (s.onPrimary, null),
    'primaryContainer': (Color(s.primaryContainer.value), null),
    'onPrimaryContainer': (s.onPrimaryContainer, null),
    'secondary': (s.secondary, s.onSecondary),
    'onSecondary': (s.onSecondary, null),
    'secondaryContainer': (s.secondaryContainer, null),
    'onSecondaryContainer': (s.onSecondaryContainer, null),
    'tertiary': (s.tertiary, s.onTertiary),
    'onTertiary': (s.onTertiary, null),
    'tertiaryContainer': (s.tertiaryContainer, null),
    'onTertiaryContainer': (s.onTertiaryContainer, null),
  };
  return colors;
}

Map<String, (Color, Color?)> _getBaseColors(ThemeData theme) {
  final s = theme.colorScheme;

  final colors = <String, (Color, Color?)>{
    'inverseSurface': (s.inverseSurface, s.onInverseSurface),
    'onInverseSurface': (s.onInverseSurface, null),
    'surfaceBright': (s.surfaceBright, null),
    'surface': (s.surface, s.onSurface),
    'onSurface': (s.onSurface, null),
    'surfaceContainerHighest': (s.surfaceContainerHighest, null),
    'surfaceContainerHigh': (s.surfaceContainerHigh, null),
    'surfaceContainer': (s.surfaceContainer, s.onSurface),
    'surfaceContainerLow': (s.surfaceContainerLow, null),
    'surfaceContainerLowest': (s.surfaceContainerLowest, null),
  };
  return colors;
}

Map<String, (Color, Color?)> _getArgoPrimaryColors(ThemeData theme) {
  (Color, Color?) getColor(ArgoVariant variant) => (Color(variant.accent.value), variant.accent.foreground);

  Map<String, (Color, Color?)> response = {};

  for (ArgoVariant variant in ArgoVariant.values) {
    response.addEntries(
      [
        MapEntry(
          variant.name,
          getColor(variant),
        ),
      ],
    );
  }

  return response;
}
