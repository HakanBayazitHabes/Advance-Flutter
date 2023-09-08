enum LanguageType { ENGLISH, TURKISH }

const String ENGLISH = "en";
const String TURKISH = "tr";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.TURKISH:
        return TURKISH;
    }
  }
}
