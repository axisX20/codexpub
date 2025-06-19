import 'package:codex/provider/task_provider.dart';
import 'package:codex/provider/locale_provider.dart';
import 'package:codex/screens/task_home.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'l10n/app_localizations.dart';

void main() => runApp(const TaskApp());

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return NeumorphicApp(
            title: AppLocalizations(localeProvider.locale).appTitle,
            debugShowCheckedModeBanner: false,
            theme: const NeumorphicThemeData(
              baseColor: Color(0xFFE0E5Ec),
              lightSource: LightSource.topLeft,
              depth: 8,
            ),
            locale: localeProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('ar')],
            home: const TaskHomePage(),
          );
        },
      ),
    );
  }
}
