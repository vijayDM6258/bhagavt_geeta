import 'package:departure_vm/Models/geeta_models.dart';
import 'package:departure_vm/Providers/language_provider.dart';
import 'package:departure_vm/Views/Screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<geetaModel> readList = [];

class ReadList extends StatefulWidget {
  const ReadList({super.key});

  @override
  State<ReadList> createState() => _ReadListState();
}

class _ReadListState extends State<ReadList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read List'),
      ),
      body: SafeArea(
        child: (readList.isEmpty)
            ? Center(
                child: Text(
                'Readlist Is Empty',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ))
            : ListView.builder(
                itemCount: readList.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return HomePage();
                          },
                        ),
                      );
                    },
                    leading: CircleAvatar(
                        child: Text(readList[index].chapter_number.toString())),
                    title: (Provider.of<LanguageProvider>(context)
                                .languageModel
                                .Hindi ==
                            false)
                        ? Text(readList[index].name_meaning)
                        : Text(readList[index].name),
                    subtitle: (Provider.of<LanguageProvider>(context)
                                .languageModel
                                .Hindi ==
                            false)
                        ? Text(readList[index].name_meaning)
                        : Text(readList[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            readList.removeAt(index);
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
