import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/enums/home_menu_enum.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:noteworthy/screens/home/home_screen.dart';
import 'package:noteworthy/screens/settings/setting_screen.dart';
import 'package:noteworthy/widgets/navbar.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  HomeMenuEnum homeMenuEnum = HomeMenuEnum.home;

  void handleChangeMenu(HomeMenuEnum selectedMenu) {
    setState(() {
      homeMenuEnum = selectedMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Scaffold(
      body: Column(
        children: <Widget>[
          NavBar(
            isDarkMode: isDarkMode,
            menuItems: <NavBarList>[
              NavBarList(
                  icon: CarbonIcons.home,
                  isSelected: homeMenuEnum == HomeMenuEnum.home,
                  onPressed: () => handleChangeMenu(HomeMenuEnum.home)),
              NavBarList(
                icon: CarbonIcons.notification,
                isSelected: homeMenuEnum == HomeMenuEnum.notifications,
                onPressed: () => handleChangeMenu(HomeMenuEnum.notifications),
              ),
              NavBarList(
                icon: CarbonIcons.search,
                isSelected: homeMenuEnum == HomeMenuEnum.search,
                onPressed: () => handleChangeMenu(HomeMenuEnum.search),
              ),
              NavBarList(
                icon: CarbonIcons.settings,
                isSelected: homeMenuEnum == HomeMenuEnum.settings,
                onPressed: () => handleChangeMenu(HomeMenuEnum.settings),
              ),
            ],
          ),
          Expanded(
            child: homeMenuEnum == HomeMenuEnum.home
                ? HomeScreen(isDarkMode: isDarkMode)
                : homeMenuEnum == HomeMenuEnum.notifications
                    ? const Text("Notification")
                    : homeMenuEnum == HomeMenuEnum.search
                        ? const Text("Search")
                        : homeMenuEnum == HomeMenuEnum.settings
                            ? const SettingsScreen()
                            : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
