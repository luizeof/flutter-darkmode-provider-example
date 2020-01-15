import 'package:flutter/foundation.dart';

/// Provider para o Dark Mode
class DynamicDarkMode with ChangeNotifier {
  /// Por padrão o App Começa com o modo Light Mode
  /// Você pode configurar um método de persistir o valor de
  /// [_isDarkMode] para que ele seja preservado quando o app for fechado
  bool _isDarkMode = false;

  /// Verifica se o App está em Dark Mode
  get isDarkMode => this._isDarkMode;

  /// Aplica o Dark Mode
  void setDarkMode() {
    this._isDarkMode = true;
    notifyListeners();
  }

  /// Aplica o Light Mode
  void setLightMode() {
    this._isDarkMode = false;
    notifyListeners();
  }
}
