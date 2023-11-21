import 'package:flutter/material.dart';
import 'package:tachione/pages/settings/settings_page.dart';
import 'package:tachione/widgets/bordered_text.dart';
// import 'package:tachione/widgets/image_tile.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsPage(),
                ),
              );
            },
            icon: const Icon(Icons.settings_outlined),
          )
        ],
      ),
      body: const Center(
        child: BorderedText(text: "Test Text"),
      ),
    );
  }
}
