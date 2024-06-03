part of '../themes/scheme_theme.dart';

Color _disabled(Color color) => color.scale(alpha: -0.5);

ButtonStyle _commonButtonStyle = ButtonStyle(
  elevation: WidgetStateProperty.resolveWith((state) {
    if (state.contains(WidgetState.disabled)) {
      return 0;
    } else {
      return 3;
    }
  }),
);

FilledButtonThemeData _filledButtonThemeData(ColorScheme colorScheme) => FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            if (state.contains(WidgetState.disabled)) {
              return _disabled(
                colorScheme.primary,
              );
            } else {
              if (state.contains(WidgetState.hovered)) {
                return colorScheme.secondary;
              } else if (state.contains(WidgetState.focused)) {
                return colorScheme.tertiary;
              } else {
                return colorScheme.primary;
              }
            }
          },
        ),
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onPrimary,
        ),
      ).merge(_commonButtonStyle),
    );

ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme colorScheme) => ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            if (state.contains(WidgetState.disabled)) {
              return _disabled(
                colorScheme.surfaceContainerHighest,
              );
            } else {
              return colorScheme.surfaceContainerHighest;
            }
          },
        ),
        foregroundColor: WidgetStatePropertyAll(
          colorScheme.onSurface,
        ),
      ).merge(_commonButtonStyle),
    );

TextButtonThemeData _textButtonThemeData(ColorScheme colorScheme) => TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.primary;
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return colorScheme.tertiary;
            } else {
              return foreground;
            }
          },
        ),
      ).merge(_commonButtonStyle),
    );

OutlinedButtonThemeData _outlinedButtonThemeData(ColorScheme colorScheme) => OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.primary;
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return colorScheme.secondary;
            } else {
              return foreground;
            }
          },
        ),
        side: WidgetStateBorderSide.resolveWith((state) {
          Color color = colorScheme.primary;
          if (state.contains(WidgetState.disabled)) {
            color = _disabled(color);
          } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
            color = colorScheme.secondary;
          }
          return BorderSide(color: color);
        }),
      ).merge(_commonButtonStyle),
    );

FloatingActionButtonThemeData _floatingActionButtonThemeData(ColorScheme colorScheme) => FloatingActionButtonThemeData(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary,
      hoverColor: colorScheme.tertiary,
      focusColor: colorScheme.tertiary,
    );

MenuButtonThemeData _menuButtonThemeData(ColorScheme colorScheme) => MenuButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.onSurface;
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return foreground.mix(colorScheme.secondary);
            } else {
              return foreground;
            }
          },
        ),
      ).merge(_commonButtonStyle),
    );

SegmentedButtonThemeData _segmentedButtonThemeData(ColorScheme colorScheme) => SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color background = colorScheme.surfaceContainerHighest;
            if (state.contains(WidgetState.selected)) {
              background = colorScheme.primary;
              if (state.contains(WidgetState.hovered) || state.contains(WidgetState.focused)) {
                background = colorScheme.secondary;
              }
            }
            if (state.contains(WidgetState.disabled)) {
              background = _disabled(background);
            }
            return background;
          },
        ),
        side: WidgetStateBorderSide.resolveWith(
          (state) {
            if (state.contains(WidgetState.selected)) {
              if (state.contains(WidgetState.hovered) || state.contains(WidgetState.focused)) {
                return BorderSide(
                  color: colorScheme.tertiary,
                );
              }
              return BorderSide(
                color: colorScheme.secondary,
              );
            }
            if (state.contains(WidgetState.disabled)) {
              return BorderSide(
                color: _disabled(colorScheme.tertiary),
              );
            }
            return BorderSide(
              color: colorScheme.outline,
            );
          },
        ),
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.onSurface;
            if (state.contains(WidgetState.selected)) {
              foreground = colorScheme.onPrimary;
            } else {
              if (state.contains(WidgetState.hovered)) {
                foreground = colorScheme.onSecondary;
              }
              if (state.contains(WidgetState.focused)) {
                foreground = colorScheme.onTertiary;
              }
            }
            return foreground;
          },
        ),
      ).merge(_commonButtonStyle),
    );

ToggleButtonsThemeData _toggleButtonsThemeData(ColorScheme colorScheme) => ToggleButtonsThemeData(
      color: colorScheme.onSurface,
      fillColor: colorScheme.primary,
      selectedColor: colorScheme.onPrimary,
      hoverColor: colorScheme.secondary,
      focusColor: colorScheme.tertiary,
      borderColor: colorScheme.outline,
      selectedBorderColor: colorScheme.surfaceContainerHighest.mix(colorScheme.primary),
      disabledBorderColor: _disabled(colorScheme.outline),
      disabledColor: _disabled(
        colorScheme.onSurface,
      ),
    );
