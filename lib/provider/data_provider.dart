import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../model/gita_model.dart';

class DataProvider extends ChangeNotifier {
  List<GeetaModel> newData = [];

  Future<void> getGeetaData() async {
    String getData = await rootBundle.loadString('assets/json/geeta_data.json');
    Map geeta = jsonDecode(getData);
    List<dynamic> allData = geeta["geeta"];
    newData = allData
        .map(
          (e) => GeetaModel(
        id: e['id'],
        chapterNumber: e['chapter_number'],
        versesCount: e['verses_count'],
        name: e['name'],
        nameMeaning: e['name_meaning'],
        nameTranslation: e['name_translation'],
        chapterSummary: e['chapter_summary'],
        chapterSummaryHindi: e['chapter_summary_hindi'],
      ),
    )
        .toList();
    notifyListeners();
  }
}
