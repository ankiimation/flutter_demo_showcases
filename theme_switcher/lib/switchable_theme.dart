import 'package:flutter/material.dart';

class SwitchableThemeData {
  final ThemeData themeData;
  SwitchableThemeData({
    required this.themeData,
  });
}

class ThemeSwitcher extends InheritedWidget {
  final SwitchableThemeData theme;
  ThemeSwitcher({
    Key? key,
    required this.theme,
    required Widget Function(
            BuildContext, SwitchableThemeData switchableThemeData)
        builder,
  }) : super(
          key: key,
          child: Builder(builder: (context) => builder(context, theme)),
        );

  static SwitchableThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSwitcher>()!.theme;
  }

  @override
  bool updateShouldNotify(ThemeSwitcher oldWidget) {
    return oldWidget.theme != this.theme;
  }
}

class PermissionCheckWidget extends StatelessWidget {
  final Widget child;
  final String permissions;
  const PermissionCheckWidget({
    Key? key,
    required this.child,
    required this.permissions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _userPermissions.contains(permissions) ? child : SizedBox();
  }
}

class PermissionState {
  loaded(permissions);

  static const searchPermissions = [];
}
