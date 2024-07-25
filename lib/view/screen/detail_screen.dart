import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/gita_model.dart';
import '../../provider/lang_provider.dart';
import '../widgets/side_bar.dart';

class DetailScreen extends StatelessWidget {
  GeetaModel geeta;
  DetailScreen({super.key, required this.geeta});

  @override
  Widget build(BuildContext context) {
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        title: (langProvider.isLangModel.isLang == false)
            ? Text(geeta.nameMeaning)
            : Text(geeta.name),
      ),
      endDrawer: const Navbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: double.minPositive,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'assets/img/lord_krishna.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (langProvider.isLangModel.isLang == false)
                                  ? 'Chapter No. : ${geeta.chapterNumber}'
                                  : 'अध्याय संख्या. : ${geeta.chapterNumber}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Text(
                              (langProvider.isLangModel.isLang == false)
                                  ? 'Chapter Name : ${geeta.nameMeaning}'
                                  : 'अध्याय का नाम : ${geeta.name}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.topLeft,
                        child: (langProvider.isLangModel.isLang == false)
                            ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            geeta.chapterSummary,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            geeta.chapterSummaryHindi,
                            style: const TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
