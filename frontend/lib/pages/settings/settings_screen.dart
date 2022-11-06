import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sync_fit/pages/settings/widgets/settings_tile.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24),
            child: AutoSizeText(
              "Settings",
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SettingsTile(
            title: 'Account',
            onTap: () {},
            icon: FontAwesomeIcons.user,
          ),
          SettingsTile(
            title: 'Notifications',
            onTap: () {},
            icon: FontAwesomeIcons.bell,
          ),
          SettingsTile(
            title: 'Appearance',
            onTap: () {},
            icon: FontAwesomeIcons.eye,
          ),
          SettingsTile(
            title: 'Privacy & Security',
            onTap: () {},
            icon: FontAwesomeIcons.hand,
          ),
          SettingsTile(
            title: 'Help & Support',
            onTap: () {},
            icon: FontAwesomeIcons.headphones,
          ),
          SettingsTile(
            title: 'About',
            onTap: () {},
            icon: FontAwesomeIcons.circleInfo,
          ),
          const Spacer(),
          const LogoutButton(),
          const Spacer(),
        ],
      ),
    );
  }
}
