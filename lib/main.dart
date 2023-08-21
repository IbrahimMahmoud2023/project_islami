import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/core/style/app_theme.dart';
import 'package:islami_app/layout/home_layout.dart';
import 'package:islami_app/moduls/hadeth/hadeht_details.dart';
import 'package:islami_app/moduls/quarn/sura_detils_view.dart';

//import 'package:islami_app/moduls/sebha/sebha_view.dart';
import 'package:islami_app/moduls/splash/splash_view.dart';
import 'package:islami_app/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: provider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.currentLanguage),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        HomeLayout.routeName: (context) => HomeLayout(),
        SuraDetailsView.routeName: (context) => SuraDetailsView(),
        HadethDetailsVeiw.routeName: (context) => HadethDetailsVeiw(),
      },
    );
  }
}
