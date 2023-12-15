import 'package:departure_vm/Models/geeta_models.dart';
import 'package:departure_vm/Providers/language_provider.dart';
import 'package:departure_vm/Providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FullScreen extends StatefulWidget {
  FullScreen({super.key, required this.geeta});

  geetaModel geeta;

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        title: (Provider.of<LanguageProvider>(context).languageModel.Hindi ==
                false)
            ? Text(widget.geeta.name_meaning)
            : Text(widget.geeta.name),
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
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/vasudev.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: (Provider.of<LanguageProvider>(context)
                            .languageModel
                            .Hindi ==
                        false)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.geeta.chapter_summary,
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.geeta.chapter_summary_hindi),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
