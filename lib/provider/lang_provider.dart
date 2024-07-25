import 'package:flutter/cupertino.dart';
import '../model/lang_model.dart';

class LangProvider extends ChangeNotifier {
  IsLangModel isLangModel = IsLangModel(isLang: false);
  void changeLang() {
    isLangModel.isLang = !isLangModel.isLang;
    notifyListeners();
  }
}
