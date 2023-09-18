import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          onTap: () {},
        ),
        ListTile(
          title: Text(
            AppStrings.contactUs,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.contactUsIc),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            AppStrings.inviteYourFriends,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
          trailing: SvgPicture.asset(ImageAssets.settingsRightArrowIc),
          onTap: () {},
        ),
        ListTile(
          title: Text(
            AppStrings.logout,
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: SvgPicture.asset(ImageAssets.logoutIc),
          onTap: () {},
        ),
      ],
    );
  }
}
