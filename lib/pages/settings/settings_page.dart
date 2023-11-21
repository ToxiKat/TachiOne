import 'package:flutter/material.dart';
import 'package:tachione/values/variables.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Appearance")),
      body: ListView(
        children: [
          const ListTile(title: Text("Theme")),
          ListTile(
            title: const Text("Dark mode"),
            subtitle: useSystemTheme.value
                ? const Text("Follow System")
                : isDarkTheme.value
                    ? const Text("On")
                    : const Text("Off"),
            onTap: () {
              _darkmode(context);
            },
          ),
          ListTile(
            title: const Text("Manga Source"),
            subtitle: const Text("change manga source"),
            trailing: DropdownButton(
              value: currentmangaSource,
              items: mangaSources.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  currentmangaSource = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _darkmode(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: useSystemTheme.value
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_off),
                title: const Text("Follow system"),
                onTap: () {
                  useSystemTheme.value = true;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ListTile(
                leading: useSystemTheme.value
                    ? const Icon(Icons.radio_button_off)
                    : isDarkTheme.value
                        ? const Icon(Icons.radio_button_checked)
                        : const Icon(Icons.radio_button_off),
                title: const Text("On"),
                onTap: () {
                  useSystemTheme.value = false;
                  isDarkTheme.value = true;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              ListTile(
                leading: useSystemTheme.value
                    ? const Icon(Icons.radio_button_off)
                    : isDarkTheme.value
                        ? const Icon(Icons.radio_button_off)
                        : const Icon(Icons.radio_button_checked),
                title: const Text("Off"),
                onTap: () {
                  useSystemTheme.value = false;
                  isDarkTheme.value = false;
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
