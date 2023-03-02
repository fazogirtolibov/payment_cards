import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AdaptiveThemeMode? themeMode;
  Future<void> _getMode() async {
    themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {});
  }

  Future<void> _switchTheme() async {
    if (themeMode!.isDark) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
    await _getMode();
  }

  @override
  void initState() {
    _getMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Settings',
        widget: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
        ),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(
              Theme.of(context).scaffoldBackgroundColor == Colors.white
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: Theme.of(context).cardColor),
          onPressed: () async {
            await _switchTheme();
          },
        ),
      ),
    );
  }
}
