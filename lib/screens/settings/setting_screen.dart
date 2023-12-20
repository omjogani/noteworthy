import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/constants/font_styles.dart';
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
  SettingListEnum settingList = SettingListEnum.profile;

  void handleChangeSettingMenu(SettingListEnum selectedSettingListEnm) {
    setState(() {
      settingList = selectedSettingListEnm;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
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
                    isSelected: settingList == SettingListEnum.profile,
                    icon: CarbonIcons.user_avatar,
                    text: "Profile",
                    onPressed: () =>
                        handleChangeSettingMenu(SettingListEnum.profile),
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingListEnum.yourLinks,
                    icon: CarbonIcons.link,
                    text: "Your Links",
                    onPressed: () =>
                        handleChangeSettingMenu(SettingListEnum.yourLinks),
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingListEnum.notifications,
                    icon: CarbonIcons.notification,
                    text: "Notifications",
                    onPressed: () =>
                        handleChangeSettingMenu(SettingListEnum.notifications),
                  ),
                  SettingMenuBarTile(
                    isSelected: settingList == SettingListEnum.account,
                    icon: CarbonIcons.settings,
                    text: "Account",
                    onPressed: () =>
                        handleChangeSettingMenu(SettingListEnum.account),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              flex: 4,
              child: SettingBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        settingList.name.substring(0, 1).toUpperCase() +
                            settingList.name.substring(1).toLowerCase(),
                        style: titleTextStyle.copyWith(
                            fontWeight: FontWeight.normal),
                      ),
                      Divider(
                        color: isDarkMode ? darkBorderColor : lightBorderColor,
                      ),
                      const SizedBox(height: 10.0),
                      SettingListTile(
                        icon: CarbonIcons.light,
                        title: "Dark Theme",
                        description: "Choose theme speaks to your soul!",
                        isDarkMode: isDarkMode,
                        actionWidget: CupertinoSwitch(
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
                      ),
                    ],
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
