import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tachione/widgets/bordered_text.dart';
import 'package:tachione/widgets/manga_title.dart';

class MangaInfo extends StatefulWidget {
  final String mangaId;
  final String mangaName;
  const MangaInfo({required this.mangaId, required this.mangaName, super.key});
  @override
  State<MangaInfo> createState() => _MangaInfoState();
}

class _MangaInfoState extends State<MangaInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mangaName),
      ),
      body: FutureBuilder(
        future: _mangaInfo(widget.mangaId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Widget> genresWidgets = [
              const Text(
                'Genres: ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ];
            if (snapshot.data["genres"] != null) {
              for (String i in snapshot.data["genres"]) {
                genresWidgets.add(BorderedText(text: i));
              }
            }
            String description = snapshot.data["description"]["en"] ?? "";
            return Scrollable(
              viewportBuilder: (context, position) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: BookInfoWidget(
                        coverImageUrl: snapshot.data["image"],
                        bookTitle: snapshot.data["title"],
                        bookStatus: snapshot.data["status"],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: genresWidgets,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(description),
                    )
                  ],
                );
              },
            );
          } else {
            return const Center(child: RefreshProgressIndicator());
          }
        },
      ),
    );
  }

  Future<Map?> _mangaInfo(String id) async {
    Map? out;
    print(
        "Url : ${Uri.parse("https://api.consumet.org/manga/mangadex/info/$id").toString()}");
    final response = await http
        .get(Uri.parse("https://api.consumet.org/manga/mangadex/info/$id"));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      out = data;
      // print("response: $out");
    }
    return out;
  }
}
