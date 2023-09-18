import 'package:advance_flutter/app/app_prefs.dart';
import 'package:advance_flutter/app/di.dart';
import 'package:advance_flutter/data/data_source/local_data_source.dart';
import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  AppPreferences _appPreferences = instance<AppPreferences>();
  LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppPadding.p8),
      children: [
        ListTile(
          title: Text(
            AppStrings.changeLanguage,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.changeLangIc),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {
            _changeLanguage();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.contactUs,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.contactUsIc),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {
            _contactUs();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.inviteYourFriends,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {
            _inviteYourFriends();
          },
        ),
        ListTile(
          title: Text(
            AppStrings.logout,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.logoutIc),
          onTap: () {
            _logout();
          },
        ),
      ],
    );
  }

  void _changeLanguage() {
    //I will apply later
  }

  void _contactUs() {}

  void _inviteYourFriends() {
    // its a task to share app name with friends
  }

  void _logout() {
    // its a task to logout from app
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
