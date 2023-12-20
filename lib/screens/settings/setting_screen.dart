import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/enums/setting_enum.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:noteworthy/screens/settings/components/setting_box.dart';
import 'package:noteworthy/screens/settings/components/setting_list_tile.dart';
import 'package:noteworthy/screens/settings/components/setting_menubar.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  SettingList settingList = SettingList.profile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SettingMenuBar(
                settingMenuList: [
                  SettingMenuBarTile(
                    isSelected: settingList == SettingList.profile,
                    icon: Icons.account_circle_outlined,
                    text: "Profile",
                    onPressed: () {
                      setState(() {
                        settingList = SettingList.profile;
                      });
                    },
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingList.yourLinks,
                    icon: Icons.link_outlined,
                    text: "Your Links",
                    onPressed: () {
                      setState(() {
                        settingList = SettingList.yourLinks;
                      });
                    },
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingList.notifications,
                    icon: Icons.notifications_outlined,
                    text: "Notifications",
                    onPressed: () {
                      setState(() {
                        settingList = SettingList.notifications;
                      });
                    },
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingList.account,
                    icon: Icons.settings_outlined,
                    text: "Account",
                    onPressed: () {
                      setState(() {
                        settingList = SettingList.account;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              flex: 4,
              child: SettingBox(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        CupertinoSwitch(
                          value: isDarkMode,
                          onChanged: (bool newValue) {
                            final provider = Provider.of<ThemeProvider>(context,
                                listen: false);
                            provider.toggleTheme(newValue);
                            setState(() {
                              isDarkMode = newValue;
                            });
                          },
                        ),
                        const SizedBox(height: 20.0),
                        SettingListTile(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
