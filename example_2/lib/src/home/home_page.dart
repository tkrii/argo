import 'package:argo/argo.dart';
import 'package:example/main.dart';
import 'package:example/src/colors/colors_view.dart';
import 'package:example/src/constants.dart';
import 'package:example/src/containers/containers_view.dart';
import 'package:example/src/controls/controls_view.dart';
import 'package:example/src/fonts/fonts_view.dart';
import 'package:example/src/home/color_disk.dart';
import 'package:example/src/textfields/text_fields_view.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  HomePageState();

  int _selectedIndex = 0;

  final _items = <Widget, (Widget, Widget, String)>{
    const FontsView(): (
      const Badge(
        label: Text('123'),
        child: Icon(Ionicons.text_outline),
      ),
      const Badge(
        label: Text('123'),
        child: Icon(Ionicons.text_outline),
      ),
      'Fonts'
    ),
    const ControlsView(): (
      const Icon(Ionicons.radio_button_on_outline),
      const Icon(Ionicons.radio_button_on),
      'Controls'
    ),
    const TextFieldsView(): (
      const Icon(Ionicons.pencil_outline),
      const Icon(Ionicons.pencil),
      'TextFields'
    ),
    const ColorsView(): (
      const Icon(Ionicons.color_palette_outline),
      const Icon(Ionicons.color_palette),
      'Palette'
    ),
    const ContainersView(): (
      const Icon(Ionicons.browsers_outline),
      const Icon(Ionicons.browsers),
      'Containers'
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _Drawer(
        selectedIndex: _selectedIndex,
        onSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.of(context).pop();
        },
        items: _items,
      ),
      appBar: AppBar(
        leading: Center(
          child: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Ionicons.menu),
          ),
        ),
        title: const _Title(),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: kWrapSpacing),
            child: _ThemeButton(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: kWrapSpacing),
            child: IconButton(
              icon: const Icon(Icons.info),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LicensePage(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              children: [
                NavigationRail(
                  destinations: [
                    for (final item in _items.entries)
                      NavigationRailDestination(
                        icon: item.value.$1,
                        selectedIcon: item.value.$2,
                        label: Text(item.value.$3),
                      ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) =>
                      setState(() => _selectedIndex = index),
                ),
                const VerticalDivider(
                  width: 0.0,
                ),
                Expanded(
                  child: Center(
                    child: _items.entries.elementAt(_selectedIndex).key,
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: _items.entries.elementAt(_selectedIndex).key,
                  ),
                ),
                const Divider(
                  height: 0.0,
                ),
                NavigationBar(
                  destinations: [
                    for (final item in _items.entries)
                      NavigationDestination(
                        icon: item.value.$1,
                        selectedIcon: item.value.$2,
                        label: item.value.$3,
                      ),
                  ],
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) =>
                      setState(() => _selectedIndex = index),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  const _ThemeButton();

  @override
  Widget build(BuildContext context) {
    final theme = ArgoTheme.of(context);
    final light = theme.themeMode == ThemeMode.light;

    return PopupMenuButton<Color>(
      padding: EdgeInsets.zero,
      icon: Icon(
        Ionicons.eyedrop,
        color: Theme.of(context).primaryColor,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: () => AppTheme.apply(context, highContrast: true),
            child: Row(
              children: [
                ColorDisk(
                  color: light ? Colors.black : Colors.white,
                  selected: theme.highContrast == true,
                ),
                const Text('highContrast'),
              ],
            ),
          ),
          for (final variant in ArgoVariant.values) // skip flavors
            PopupMenuItem(
              onTap: () => AppTheme.apply(
                context,
                variant: variant,
                highContrast: false,
              ),
              child: Row(
                children: [
                  ColorDisk(
                    color: variant.color,
                    selected:
                        variant == theme.variant && theme.highContrast != true,
                  ),
                  Text(variant.name),
                ],
              ),
            ),
        ];
      },
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final theme = ArgoTheme.of(context);
    var light = theme.themeMode == ThemeMode.light;

    return IconButton(
      onPressed: () {
        return AppTheme.apply(
          context,
          themeMode: light ? ThemeMode.dark : ThemeMode.light,
        );
      },
      icon: Icon(
        light ? Ionicons.sunny : Ionicons.moon,
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    required this.items,
    required this.onSelected,
    required this.selectedIndex,
  });

  final Map<Widget, (Widget, Widget, String)> items;
  final Function(int index) onSelected;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          for (var i = 0; i < items.length; i++)
            ListTile(
              selected: i == selectedIndex,
              leading: i == selectedIndex
                  ? items.entries.elementAt(i).value.$2
                  : items.entries.elementAt(i).value.$1,
              title: Text(items.entries.elementAt(i).value.$3),
              onTap: () => onSelected(i),
            ),
        ],
      ),
    );
  }
}
