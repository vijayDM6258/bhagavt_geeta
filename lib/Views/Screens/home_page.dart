import 'dart:convert';
import 'package:departure_vm/Models/geeta_models.dart';
import 'package:departure_vm/Providers/language_provider.dart';
import 'package:departure_vm/Providers/theme_provider.dart';
import 'package:departure_vm/Views/Screens/full_screen.dart';
import 'package:departure_vm/Views/Screens/read_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<geetaModel> Newsaar = [];

  @override
  void initState() {
    GetGeetaData().then((value) {
      setState(() {});
    });
    super.initState();
  }

  Future<void> GetGeetaData() async {
    String Gdata = await rootBundle.loadString('assets/bhagavad_geeta.json');
    Map saar = jsonDecode(Gdata);
    List<dynamic> allsaar = saar['bhagavad_gita'];

    Newsaar = allsaar
        .map((e) => geetaModel(
            chapter_number: e['chapter_number'],
            id: e['id'],
            chapter_summary: e['chapter_summary'],
            chapter_summary_hindi: e['chapter_summary_hindi'],
            name: e['name'],
            name_meaning: e['name_meaning'],
            name_translation: e['name_translation'],
            verses_count: e['verses_count']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Account'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Personal details'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Passwords & Security'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Ads Personalized'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text('Subscription'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ReadList();
                      },
                    ));
                  },
                  child: Text('Readlist'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text('About App'),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // backgroundColor: Color(0xffCA9363),
        title: Text(
          'Bhagavad Saar',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<LanguageProvider>(context, listen: false)
                  .ChangeLanguage();
            },
            icon: (Provider.of<LanguageProvider>(context).languageModel.Hindi ==
                    false)
                ? Icon(Icons.abc)
                : Icon(Icons.language_outlined),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).ChangeTheme();
            },
            icon:
                (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
                    ? Icon(Icons.light_mode_outlined)
                    : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: ListView(
        children: Newsaar.map(
          (e) => Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text(e.chapter_number.toString()),
              ),
              title:
                  (Provider.of<LanguageProvider>(context).languageModel.Hindi ==
                          false)
                      ? Text(e.name_meaning)
                      : Text(e.name),
              subtitle: Text(e.name_translation),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    readList.add(e);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to Read List")));
                  });
                },
                icon: Icon(
                  Icons.book,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FullScreen(geeta: e);
                    },
                  ),
                );
              },
            ),
          ),
        ).toList(),
      ),
    );
  }
}
