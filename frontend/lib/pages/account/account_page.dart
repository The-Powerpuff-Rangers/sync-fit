import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sync_fit/widgets/custom_tile.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

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
              "Account",
              style: TextStyle(
                fontFamily: 'SF-Pro Display',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CustomTile(
            title: 'Doctor Details',
            onTap: () {},
          ),
          CustomTile(
            title: 'Health Details',
            onTap: () {},
          ),
          CustomTile(title: 'Change Move Goal', onTap: () {}),
          CustomTile(
            title: 'About',
            onTap: () {},
          ),
          CustomTile(
            title: 'Contribute',
            onTap: () {},
          ),
          const Spacer(),
          CustomTile(
            title: 'Privacy Policy',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
