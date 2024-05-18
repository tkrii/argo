part of '../themes/scheme.dart';

Color _disabled(Color color) => color.scale(alpha: -0.5);

ButtonStyle _commonButtonStye = ButtonStyle(
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius)),
  ),
  padding: WidgetStatePropertyAll(
    EdgeInsets.symmetric(
      vertical: 0.75 * rem,
      horizontal: rem,
    ),
  ),
  elevation: WidgetStateProperty.resolveWith((state) {
    if (state.contains(WidgetState.disabled)) {
      return 0;
    } else {
      return 3;
    }
  }),
);

FilledButtonThemeData _filledButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            if (state.contains(WidgetState.disabled)) {
              return _disabled(
                colorTheme.primaryBackground(colorScheme.brightness),
              );
            } else {
              if (state.contains(WidgetState.hovered)) {
                return colorTheme.primaryHoverBackground(colorScheme.brightness);
              } else if (state.contains(WidgetState.focused)) {
                return colorTheme.primaryFocus(colorScheme.brightness);
              } else {
                return colorTheme.primaryBackground(colorScheme.brightness);
              }
            }
          },
        ),
        foregroundColor: WidgetStatePropertyAll(
          colorTheme.primaryBackground(colorScheme.brightness).foregroundBrightColor,
        ),
      ).merge(_commonButtonStye),
    );

ElevatedButtonThemeData _elevatedButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            if (state.contains(WidgetState.disabled)) {
              return _disabled(
                colorScheme.secondary,
              );
            } else {
              if (state.contains(WidgetState.hovered) || state.contains(WidgetState.focused)) {
                Color hoverBackground = colorScheme.isLight ? ArgoColors.slate.shade650 : ArgoColors.slate.shade550;
                return hoverBackground;
              } else {
                return colorScheme.secondary;
              }
            }
          },
        ),
        foregroundColor: const WidgetStatePropertyAll(
          ArgoColors.white,
        ),
      ).merge(_commonButtonStye),
    );

TextButtonThemeData _textButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) => TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorTheme.primary(colorScheme.brightness);
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return colorTheme.primaryHover(colorScheme.brightness);
            } else {
              return foreground;
            }
          },
        ),
      ).merge(_commonButtonStye),
    );

OutlinedButtonThemeData _outlinedButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.transparent,
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorTheme.primary(colorScheme.brightness);
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return colorTheme.primaryHover(colorScheme.brightness);
            } else {
              return foreground;
            }
          },
        ),
        side: WidgetStateBorderSide.resolveWith((state) {
          Color color = colorTheme.primary(colorScheme.brightness);
          if (state.contains(WidgetState.disabled)) {
            color = _disabled(color);
          } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
            color = colorTheme.primaryHover(colorScheme.brightness);
          }
          return BorderSide(color: color);
        }),
      ).merge(_commonButtonStye),
    );

FloatingActionButtonThemeData _floatingActionButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    FloatingActionButtonThemeData(
      foregroundColor: colorTheme.primaryBackground(colorScheme.brightness).foregroundBrightColor,
      backgroundColor: colorTheme.primaryBackground(colorScheme.brightness),
      hoverColor: colorTheme.primaryHoverBackground(colorScheme.brightness),
      focusColor: colorTheme.primaryFocus(colorScheme.brightness),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBigBorderRadius),
      ),
    );

MenuButtonThemeData _menuButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) => MenuButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.surface.foregroundBrightColor;
            if (state.contains(WidgetState.disabled)) {
              return _disabled(foreground);
            } else if (state.contains(WidgetState.focused) || state.contains(WidgetState.hovered)) {
              return colorTheme.primaryHover(colorScheme.brightness);
            } else {
              return foreground;
            }
          },
        ),
      ).merge(_commonButtonStye),
    );

SegmentedButtonThemeData _segmentedButtonThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color background = colorScheme.surfaceContainerLowest;
            if (state.contains(WidgetState.selected)) {
              background = colorTheme.primaryBackground(colorScheme.brightness);
              if (state.contains(WidgetState.hovered) || state.contains(WidgetState.focused)) {
                background = colorTheme.primaryHoverBackground(colorScheme.brightness);
              }
            }
            if (state.contains(WidgetState.disabled)) {
              background = _disabled(background);
            }
            return background;
          },
        ),
        foregroundColor: WidgetStateColor.resolveWith(
          (state) {
            Color foreground = colorScheme.onSurface.foregroundBrightColor;
            if (state.contains(WidgetState.selected)) {
              foreground = colorTheme.primary(colorScheme.brightness).brightness.inverse == Brightness.dark
                  ? ArgoColors.black
                  : ArgoColors.white;
            } else {
              if (state.contains(WidgetState.hovered)) {
                foreground = colorTheme.primaryHover(colorScheme.brightness);
              }
              if (state.contains(WidgetState.focused)) {
                foreground = colorTheme.primaryFocus(colorScheme.brightness);
              }
            }
            return foreground;
          },
        ),
      ).merge(_commonButtonStye),
    );

ToggleButtonsThemeData _toggleButtonsThemeData(ColorScheme colorScheme, ArgoColorTheme colorTheme) =>
    ToggleButtonsThemeData(
      color: colorScheme.surface.foregroundBrightColor,
      fillColor: colorTheme.primaryBackground(colorScheme.brightness),
      selectedColor: colorTheme.primaryBackground(colorScheme.brightness).foregroundBrightColor,
      borderRadius: BorderRadius.circular(kBorderRadius),
      hoverColor: colorTheme.primaryHoverBackground(colorScheme.brightness),
      focusColor: colorTheme.primaryFocus(colorScheme.brightness),
      borderColor: colorScheme.outline,
      selectedBorderColor: colorTheme.primaryUnderline(colorScheme.brightness),
      disabledBorderColor: colorScheme.outline,
      disabledColor: _disabled(
        colorScheme.surface.foregroundBrightColor,
      ),
      borderWidth: kBorderWidth,
    );
