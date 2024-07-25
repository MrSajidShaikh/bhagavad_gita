import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/data_provider.dart';
import '../../provider/lang_provider.dart';
import '../../provider/theme_provider.dart';
import '../widgets/side_bar.dart';
import 'detail_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider = Provider.of<DataProvider>(context);
    ThemeProvider themeProviderFalse =
    Provider.of<ThemeProvider>(context, listen: false);
    LangProvider langProvider = Provider.of<LangProvider>(context);
    LangProvider langProviderFalse =
    Provider.of<LangProvider>(context, listen: false);
    dataProvider.getGeetaData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bhagavad Geeta'),
        centerTitle: true,
      ),
      drawer: const Navbar(),
      body: ListView(
        children: dataProvider.newData.map(
              (e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Card(
                margin: const EdgeInsets.all(5),
                shadowColor: Colors.greenAccent,
                surfaceTintColor: Colors.blueAccent,
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(e.chapterNumber.toString()),
                  ),
                  title: (langProvider.isLangModel.isLang == false)
                      ? Text(e.nameMeaning)
                      : Text(e.name),
                  subtitle: Text(e.nameTranslation),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailScreen(geeta: e);
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
