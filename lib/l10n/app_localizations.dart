import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'appTitle': 'Task Manager',
      'myTasks': 'My Tasks',
      'noTasks': 'No tasks added yet.',
      'addTask': 'Add Task',
      'taskName': 'Task Name',
      'taskDescription': 'Task Description',
      'enterName': 'Enter task name',
      'enterDescription': 'Enter description',
      'noDeadline': 'No deadline chosen',
      'selectDeadline': 'Select Deadline',
      'status': 'Status',
      'urgent': 'Urgent',
      'important': 'Important',
      'simple': 'Simple',
      'selectStatus': 'Select status',
      'save': 'Save',
      'due': 'Due',
    },
    'ar': {
      'appTitle': '\u0645\u062f\u064a\u0631 \u0627\u0644\u0645\u0647\u0627\u0645',
      'myTasks': '\u0645\u0647\u0627\u0645\u064a',
      'noTasks': '\u0644\u0645 \u062a\u062a\u0645 \u0625\u0636\u0627\u0641\u0629 \u0645\u0647\u0627\u0645 \u0628\u0639\u062f',
      'addTask': '\u0625\u0636\u0627\u0641\u0629 \u0645\u0647\u0645\u0629',
      'taskName': '\u0627\u0633\u0645 \u0627\u0644\u0645\u0647\u0645\u0629',
      'taskDescription': '\u0648\u0635\u0641 \u0627\u0644\u0645\u0647\u0645\u0629',
      'enterName': '\u0623\u062f\u062e\u0644 \u0627\u0633\u0645 \u0627\u0644\u0645\u0647\u0645\u0629',
      'enterDescription': '\u0623\u062f\u062e\u0644 \u0627\u0644\u0648\u0635\u0641',
      'noDeadline': '\u0644\u0645 \u064a\u062a\u0645 \u0627\u062e\u062a\u064a\u0627\u0631 \u0645\u0648\u0639\u062f \u0646\u0647\u0627\u0626\u064a',
      'selectDeadline': '\u0627\u062e\u062a\u0631 \u0627\u0644\u0645\u0648\u0639\u062f \u0627\u0644\u0646\u0647\u0627\u0626\u064a',
      'status': '\u0627\u0644\u062d\u0627\u0644\u0629',
      'urgent': '\u0639\u0627\u062c\u0644',
      'important': '\u0645\u0647\u0645',
      'simple': '\u0628\u0633\u064a\u0637',
      'selectStatus': '\u0627\u062e\u062a\u0631 \u0627\u0644\u062d\u0627\u0644\u0629',
      'save': '\u062d\u0641\u0638',
      'due': '\u0645\u0648\u0639\u062f \u0627\u0644\u0627\u0633\u062a\u062d\u0642\u0627\u0642',
    },
  };

  String _translate(String key) => _localizedValues[locale.languageCode]![key]!;

  String get appTitle => _translate('appTitle');
  String get myTasks => _translate('myTasks');
  String get noTasks => _translate('noTasks');
  String get addTask => _translate('addTask');
  String get taskName => _translate('taskName');
  String get taskDescription => _translate('taskDescription');
  String get enterName => _translate('enterName');
  String get enterDescription => _translate('enterDescription');
  String get noDeadline => _translate('noDeadline');
  String get selectDeadline => _translate('selectDeadline');
  String get status => _translate('status');
  String get urgent => _translate('urgent');
  String get important => _translate('important');
  String get simple => _translate('simple');
  String get selectStatus => _translate('selectStatus');
  String get save => _translate('save');
  String get due => _translate('due');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
