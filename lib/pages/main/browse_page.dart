import 'dart:convert';
import 'package:tachione/pages/manga/manga_info.dart';
import 'package:tachione/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:tachione/widgets/image_tile.dart';
import 'package:tachione/widgets/search_field.dart';
import 'package:http/http.dart' as http;

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  final TextEditingController searchController = TextEditingController();
  List out = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Browse"),
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: SearchField(
            controller: searchController,
            hintText: "Search Manga",
            onChanged: (value) {
              getMangaList(value);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.68,
            crossAxisCount: 3,
            mainAxisSpacing: 8.0,
          ),
          itemCount: out.length,
          itemBuilder: (context, index) {
            return FutureBuilder(
              future: mangaCoverImage(out[index]["id"]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ImageTile(
                    title: out[index]["title"],
                    coverImage: snapshot.data,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MangaInfo(
                            mangaId: out[index]["id"],
                            mangaName: out[index]["title"],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return ImageTile(
                    title: out[index]["title"],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => MangaInfo(
                            mangaId: out[index]["id"],
                            mangaName: out[index]["title"],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }

  Future<String?> mangaCoverImage(String id) async {
    String? out;
    try {
      final response = await http
          .get(Uri.parse("https://api.consumet.org/manga/mangadex/info/${id}"));
      if (response.statusCode == 200) {
        Map data = json.decode(response.body);
        out = data["image"];
      }
    } catch (e) {
      print(e);
    }
    return out;
  }

  void getMangaList(String value) async {
    print(
        "Url : ${Uri.parse("https://api.consumet.org/manga/mangadex/${value}").toString()}");
    final response = await http
        .get(Uri.parse("https://api.consumet.org/manga/mangadex/${value}"));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      if (data["results"] != null) {
        setState(() {
          out = data["results"];
        });
      }
    }
  }
}
