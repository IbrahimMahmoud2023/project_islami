import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/moduls/hadeth/hadeth_view.dart';
import 'package:islami_app/moduls/quarn/quarn_view.dart';
import 'package:islami_app/moduls/radio/radio_view.dart';
import 'package:islami_app/moduls/sebha/sebha_view.dart';
import 'package:islami_app/moduls/settings/settings_view.dart';
import 'package:islami_app/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screenWidgte = [
    QuranView(),
    HadethView(),
    SebhaView(),
    RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(!provider.isDark()
                ? "assest/image/background_light.png"
                : "assest/image/background_dark.png"),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islami,
          ),
        ),
        body: screenWidgte[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assest/image/ic_quran.png"),
              ),
              label: AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assest/image/ic_hadeth.png"),
              ),
              label: AppLocalizations.of(context)!.hadeth,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assest/image/ic_sebha.png"),
              ),
              label: AppLocalizations.of(context)!.tasbeh,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assest/image/ic_radio.png"),
              ),
              label: AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.setting,
            ),
          ],
        ),
      ),
    );
  }
}
