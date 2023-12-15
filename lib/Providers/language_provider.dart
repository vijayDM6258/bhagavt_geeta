import 'package:departure_vm/Models/language_model.dart';
import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier {
  LanguageModel languageModel = LanguageModel(Hindi: false);

  void ChangeLanguage() {
    languageModel.Hindi = !languageModel.Hindi;
    notifyListeners();
  }
}
