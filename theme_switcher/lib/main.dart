import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// default theme
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// dark theme (will auto switch with device)
      darkTheme: ThemeData.dark(),
      home: ComponentsScreen(),
    );
  }
}

class ComponentsScreen extends StatelessWidget {
  const ComponentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MyThemeData.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Card(
            color: theme.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('theme.cardColor'),
            ),
          ),
          Card(
            color: theme.myCustomColor1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('theme.myCustomColor1'),
            ),
          ),
          Card(
            color: theme.myCustomColor2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('theme.myCustomColor2'),
            ),
          ),
          Card(
            color: theme.myCustomColor3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('theme.myCustomColor3'),
            ),
          ),
          Card(
            color: theme.customBGColorWithBrightness,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'theme.customBGColorWithBrightness (${theme.brightness})'),
            ),
          ),
        ],
      ),
    );
  }
}

extension MyThemeData on ThemeData {
  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }

  Color get myCustomColor1 => Color(0xffB73E3E);
  Color get myCustomColor2 => Color(0xffFF99D7);
  Color get myCustomColor3 => Color(0xffFFE7CC);

  TextStyle get customTextStyle => TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      );

  // custom field base on brightness (dart/light)
  Color get customBGColorWithBrightness {
    switch (brightness) {
      case Brightness.dark:
        return Colors.black;
      case Brightness.light:
        return Colors.white;
    }
  }

  TextStyle get customTextStyleWithBrightness {
    switch (brightness) {
      case Brightness.dark:
        return TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        );
      case Brightness.light:
        return TextStyle(
          fontWeight: FontWeight.w200,
          color: Colors.white,
        );
    }
  }
}
