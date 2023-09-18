import 'package:advance_flutter/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREF_APP_LANGUAGE = 'PREFS_APP_LANGUAGE';
const String PREF_KEY_ONBOARDING_SCREEN = 'PREF_KEY_ONBOARDING_SCREEN';
const String PREF_KEY_IS_USER_LOGGED_IN = 'PREF_KEY_IS_USER_LOGGED_IN';

class AppPreferences {
  SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREF_APP_LANGUAGE);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(PREF_KEY_ONBOARDING_SCREEN, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREF_KEY_ONBOARDING_SCREEN) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(PREF_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREF_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREF_KEY_IS_USER_LOGGED_IN);
  }
}
